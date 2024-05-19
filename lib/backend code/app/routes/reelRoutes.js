// app/routes/reelRoutes.js

const express = require('express');
const reelController = require('../controllers/reelController');

const router = express.Router();

router.post('/', reelController.createReel);
router.get('/', reelController.getAllReels);
router.get('/firebase/:firebaseId', reelController.getReelByFirebaseId);
router.patch('/firebase/:firebaseId',reelController.updateReel);
router.delete('/:id', reelController.deleteReel);

module.exports = router;