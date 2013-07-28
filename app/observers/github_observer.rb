require 'services/github_grabber'

class GithubObserver < ActiveRecord::Observer

  observe :project

  def after_create(project)
    project.sync_with_github
  end

  def after_update(project)
    project.sync_with_github if should_sync_after_update?(project)
  end

  def after_destory(project)
    project.unsubscribe_to_service_hook if project.should_sync_with_github?
  end

  private

  def should_sync_after_update?(project)
    project.repo_url_was.blank?
  end

end