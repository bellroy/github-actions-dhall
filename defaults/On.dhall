let Push = ../types/events/Push.dhall

let IssueComment = ../types/events/IssueComment.dhall

let Issues = ../types/events/Issues.dhall

let PullRequest = ../types/events/PullRequest.dhall

let PullRequestReview = ../types/events/PullRequestReview.dhall

let PullRequestReviewComment = ../types/events/PullRequestReviewComment.dhall

let Delete = ../types/events/Delete.dhall

let Schedule = ../types/events/Schedule.dhall

let RepositoryDispatch = ../types/events/RepositoryDispatch.dhall

let WorkflowCall = ../types/events/WorkflowCall.dhall

let WorkflowDispatch = ../types/events/WorkflowDispatch.dhall

let WorkflowRun = ../types/events/WorkflowRun.dhall

let Release = ../types/events/Release.dhall

let MergeGroup = ../types/events/MergeGroup.dhall

let PullRequestTarget = ../types/events/PullRequestTarget.dhall

in  { issue_comment = None IssueComment
    , issues = None Issues
    , push = None Push
    , pull_request = None PullRequest
    , pull_request_review = None PullRequestReview
    , pull_request_review_comment = None PullRequestReviewComment
    , pull_request_target = None PullRequestTarget
    , delete = None Delete
    , schedule = None (List Schedule)
    , repository_dispatch = None RepositoryDispatch
    , workflow_call = None WorkflowCall
    , workflow_dispatch = None WorkflowDispatch
    , workflow_run = None WorkflowRun
    , release = None Release
    , merge_group = None MergeGroup
    }
