const fs = require('fs');
const path = require('path');

exports.handler = async (event) => {
    try {
        const jokesPath = path.resolve(__dirname, 'jokes.txt');
        const jokes = fs.readFileSync(jokesPath, 'utf-8').split('\n').filter(Boolean);
        const randomJoke = jokes[Math.floor(Math.random() * jokes.length)];

        return {
            statusCode: 200,
            body: JSON.stringify({ message: randomJoke }),
            headers: {
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": "*", // CORS header
                "Access-Control-Allow-Headers": "Content-Type",
                "Access-Control-Allow-Methods": "OPTIONS, GET"
            }
        };
    } catch (error) {
        console.error('Error reading jokes file:', error);
        return {
            statusCode: 500,
            body: JSON.stringify({ message: 'Failed to fetch joke.' }),
            headers: {
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": "*", // CORS header
                "Access-Control-Allow-Headers": "Content-Type",
                "Access-Control-Allow-Methods": "OPTIONS, GET"
            }
        };
    }
};