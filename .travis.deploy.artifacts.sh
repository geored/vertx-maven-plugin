PROJECT_VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:evaluate -Dexpression=project.version -B | grep -v '\[')
if [[ "$PROJECT_VERSION" =~ .*SNAPSHOT ]] && [[ "${TRAVIS_BRANCH}" =~ ^master$|^[0-9]+\.[0-9]+$ ]] && [[ "${TRAVIS_PULL_REQUEST}" == "false" ]]; then
    mvn clean source:jar deploy -s .travis.maven.settings.xml -B -DskipTests
fi
