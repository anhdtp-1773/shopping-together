import superagent from "superagent";

export default {
    initApp() {
        return superagent.post('/api/app/init');
    }
}