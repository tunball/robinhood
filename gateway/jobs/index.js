const express = require("express");

// const conn = require("../../database/connection");

const JobsManager = require("../../manager/JobsManager");
const jobsRouter = express.Router();

jobsRouter.get("/", async (req, res, next) => {
 
  try {
    const {page} = req.query;

    const jobsManager = new JobsManager()
    const rs = await jobsManager.getJobs(page);
    return res.status(200).json(rs);
    
  } catch (error) {
    console.log(" Error : ", error);
  }
});

jobsRouter.get("/:id", async function (req, res, next) {
  try {

    const { id } = req.params;  

    const jobsManager = new JobsManager()
    const rs = await jobsManager.getJobById(id);
    return res.status(200).json(rs);
  
  } catch (error) {

    console.log(" Error : ", error);

    return res.status(400).json({
      status: "fail",
      message: "/jobs/:id "

    });

   
  }
});

jobsRouter.post("/assign", async function (req, res, next) {
  try {

    const { id,status } = req.body;  

    const jobsManager = new JobsManager()
    const rs = await jobsManager.assignJobs(id, status);
    return res.status(200).json(rs);
  
  } catch (error) {

    console.log(" Error : ", error);

    return res.status(400).json({
      status: "fail",
      message: "/jobs/:id "

    });

   
  }
});




module.exports = jobsRouter;


