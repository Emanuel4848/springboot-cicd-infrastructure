job('hello-world') {
  scm {
    git {
      remote {
        url('https://github.com/Emanuel4848/springboot2.git')
      }
      branch('main')
    }
  }
  triggers {
    githubPush()
  }
  steps {
    shell('echo "Hello World desde Jenkins automatico"')
  }
}