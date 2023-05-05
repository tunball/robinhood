const express = require("express");
const JobsManager = require("../../manager/JobsManager");
const ErrorManager = require("../../manager/ErrorManager");
const jobsRouter = express.Router();

jobsRouter.get("/", async (req, res, next) => {
  try {

    const { page } = req.query;

    const jobsManager = new JobsManager();
    const rs = await jobsManager.getJobs(page);
    return res.status(200).json(rs);

  } catch (error) {

      console.log(" Error : ", error);

      const errorManager = new ErrorManager(error);
      return res.status(400).json(errorManager.toAPIResponse());
  }
});

jobsRouter.get("/:id", async function (req, res, next) {
  try {

    const { id } = req.params;

    const jobsManager = new JobsManager();
    const rs = await jobsManager.getJobById(id);

    return res.status(200).json(rs);

  } catch (error) {

    console.log(" Error : ", error);

    const errorManager = new ErrorManager(error);
    return res.status(400).json(errorManager.toAPIResponse());
  }
});

jobsRouter.post("/assign", async function (req, res, next) {
  try {

    const { id, status, created_by } = req.body;

    const jobsManager = new JobsManager();
    const rs = await jobsManager.assignJobs(id, status ,created_by);
    return res.status(200).json(rs);

  } catch (error) {

    console.log(" Error : ", error);
    const errorManager = new ErrorManager(error);
    return res.status(400).json(errorManager.toAPIResponse());
  }
});

jobsRouter.post("/comment", async function (req, res, next) {
  try {

    const { detail, created_by, jobs_id } = req.body;

    const jobsManager = new JobsManager();
    const rs = await jobsManager.addComments(detail, created_by, jobs_id);
    return res.status(200).json(rs);

  } catch (error) {

    console.log(" Error : ", error);

    const errorManager = new ErrorManager(error);
    return res.status(400).json(errorManager.toAPIResponse());

    
   
  }
});

module.exports = jobsRouter;
