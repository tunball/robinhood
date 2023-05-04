const conn = require("../database/connection");

class JobsManager {

  constructor() {}

  async getJobs(p = 1) {

    const page = parseInt(p);
    const ITEMS_PER_PAGE = 3;
    const startIndex = (page - 1) * ITEMS_PER_PAGE;

    const query = `
    SELECT 
      jobs.id, jobs.title, jobs.status, 
      jobs.created_at, 
      CASE 
        WHEN LENGTH(jobs.detail) > 255 THEN  CONCAT(SUBSTRING(jobs.detail, 1, 255), '..')               
        ELSE jobs.detail
      END as detail,
      users.name, users.email, users.image
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

    // console.log(`${endIndex} < ${allJobsRow[0].countAllPage}`);
    // console.log(` page ${page} `);
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
        users.name, users.email, users.image  
      FROM jobs
      INNER JOIN users ON jobs.created_by = users.id
      WHERE jobs.id = ?
    `;

    const commentQuery = `
      SELECT * 
      FROM comments 
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

  async assignJobs(id, status) {
    
    const updJobsQuery = `UPDATE jobs SET assigned='Y' WHERE id = ? `;
    const insertQuery = `INSERT INTO assigned_jobs (jobs_id, status, created_by, created_at) 
                          VALUES (?,?, 1, NOW())`;

    const [updJobsRows] = await conn.execute(updJobsQuery, [id]);
    const [insertRows] = await conn.execute(insertQuery, [id, status]);

    const job = updJobsRows[0];
    const insert = insertRows;

    return {
      status: "success",
      data: { ...job, ...insert },
    };
  }


}

module.exports = JobsManager;


