const express = require('express');

const router = express.Router();

// Add this block of code
router.get('/', (req, res) => {
  res.send('Welcome to the home page!');
});


module.exports = router;