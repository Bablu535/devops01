<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mobile Recommendation</title>
</head>
<body>
  <h1>Mobile Recommendation System</h1>
  
  <form id="recommendationForm">
    <label for="ram">RAM Capacity (GB):</label>
    <input type="number" id="ram" name="ram" min="2" max="16" required><br><br>
    
    <label for="graphics">Graphics Card:</label>
    <select id="graphics" name="graphics">
      <option value="basic">Basic</option>
      <option value="mid-range">Mid-Range</option>
      <option value="high-end">High-End</option>
    </select><br><br>
    
    <label for="camera">Camera Quality (MP):</label>
    <input type="number" id="camera" name="camera" min="8" max="108" required><br><br>
    
    <button type="button" onclick="recommendMobiles()">Get Recommendations</button>
  </form>
  
  <h2>Recommendations:</h2>
  <ul id="recommendationsList"></ul>

  <script>
    function recommendMobiles() {
      const ram = parseInt(document.getElementById('ram').value, 10);
      const graphics = document.getElementById('graphics').value;
      const camera = parseInt(document.getElementById('camera').value, 10);

      // Example mobile database
      const mobiles = [
        { name: "Phone A", ram: 8, graphics: "mid-range", camera: 64 },
        { name: "Phone B", ram: 4, graphics: "basic", camera: 16 },
        { name: "Phone C", ram: 16, graphics: "high-end", camera: 108 },
        { name: "Phone D", ram: 6, graphics: "basic", camera: 32 },
        { name: "Phone E", ram: 12, graphics: "high-end", camera: 64 },
      ];

      // Filter recommendations based on input
      const recommendations = mobiles.filter(mobile => 
        mobile.ram >= ram && 
        mobile.graphics === graphics && 
        mobile.camera >= camera
      );

      // Inject recommendations into the DOM
      const recommendationsList = document.getElementById('recommendationsList');
      recommendationsList.innerHTML = recommendations.length
        ? recommendations.map(mobile => `<li>${mobile.name}</li>`).join('')
        : '<li>No recommendations found</li>';
    }
  </script>
</body>
</html>
