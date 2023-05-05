const conn = require("../database/connection");

class JobsManager {

  constructor() {


  }

  async getJobs(p = 1) {

    const page = parseInt(p);
    const ITEMS_PER_PAGE = 3;
    const startIndex = (page - 1) * ITEMS_PER_PAGE;

    const query = `
    SELECT 
      jobs.id, jobs.title, jobs.status, 
      jobs.created_at, 
      assigned,
      CASE 
        WHEN LENGTH(jobs.detail) > 255 THEN  CONCAT(SUBSTRING(jobs.detail, 1, 255), '..')               
        ELSE jobs.detail
      END as detail,
      users.name as created_by, users.email, users.image
    FROM jobs 
    INNER JOIN users ON jobs.created_by = users.id 
    WHERE assigned = 'N'
    ORDER BY jobs.created_at ASC
    LIMIT ?, ?
  `;
  
    const allJobsQuery = `
      SELECT 
        count(*) as countAllPage
      FROM jobs 
      INNER JOIN users ON jobs.created_by = users.id 
    
    `;
  
    const [allJobsRow]  = await conn.execute(allJobsQuery);
    const [rows]  = await conn.execute(query, [startIndex, ITEMS_PER_PAGE]);
    const endIndex = startIndex + ITEMS_PER_PAGE;
    const hasMore = endIndex < allJobsRow[0].countAllPage;
    const nextPage = hasMore ? (page + 1) : null;

    return {
      status: "success",
      length: rows.length,
      nextPage: nextPage,
      data: rows
    };
  }

  async getJobById(id) {
    
    const jobQuery = `
      SELECT
        jobs.id, jobs.title, jobs.status,
        jobs.created_at, 
        jobs.detail,
        assigned,
        users.name as created_by,   
        users.email,
        users.image  
      FROM jobs
      INNER JOIN users ON jobs.created_by = users.id
      WHERE jobs.id = ?
    `;

    const commentQuery = `
      SELECT
          comments.id,
          comments.detail,
          comments.created_at,
          users.name as created_by,                
          image,
          email
      FROM comments 
      INNER JOIN users ON comments.created_by = users.id 
      WHERE jobs_id = ?
    `;

    const [jobRows] = await conn.execute(jobQuery, [id]);
    const [commentRows] = await conn.execute(commentQuery, [id]);

    const job = jobRows[0];
    const comments = commentRows;

    return {
      status: "success",
      length: job.length,
      data: { ...job, comments },
    };
  }

  async assignJobs(id, status, created_by) {
    
    const updJobsQuery = `UPDATE jobs SET assigned='Y' WHERE id = ? `;
    const insertQuery = `INSERT INTO assigned_jobs (jobs_id, status, created_by, created_at) 
                          VALUES (?,?,?, NOW())`;

    const [updJobsRows] = await conn.execute(updJobsQuery, [id]);
    const [insertRows] = await conn.execute(insertQuery, [id, status, created_by]);

    return {
      status: "success",  
      length: updJobsRows.affectedRows,
      data: { ...updJobsRows },
    };
  }

  async addComments(detail,created_by, jobs_id) {    
    
    const insertQuery = `INSERT INTO comments(detail, created_by, created_at, jobs_id) 
                          VALUES (?,?, NOW(), ?)`;

    const [insertRows] = await conn.execute(insertQuery, [detail, created_by, jobs_id]);    
  
    return {
      status: "success",
      length: insertRows.affectedRows,
      data: { ...insertRows },
    };
  }

}

module.exports = JobsManager;


