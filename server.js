const express = require('express');
const { exec } = require('child_process');
const path = require('path');
const app = express();
const port = 3000;

// Serve static files (HTML, CSS, etc.)
app.use(express.static('public'));

// To parse JSON input from the frontend
app.use(express.json());

// Handle POST request from frontend
app.post('/suggest', (req, res) => {
  const { soil, season, water, mode } = req.body;

  // Determine which Prolog predicate to call based on mode
  const predicate = mode === 'pdf' ? 'suggest_pdf' : 'suggest_web';

  // Construct command to run the Prolog file
  const command = `swipl -q -s agro_sage.pl -g "${predicate}('${soil}', '${season}', '${water}'), halt."`;

  // Execute Prolog script and handle the response
  exec(command, (err, stdout, stderr) => {
    if (err || stderr) {
      return res.status(500).send("Error running Prolog.");
    }
    res.send(stdout); // Send output back to frontend
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
