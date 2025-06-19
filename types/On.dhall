let IssueComment = ./events/IssueComment.dhall

let Issues = ./events/Issues.dhall

let Push = ./events/Push.dhall

let PullRequest = ./events/PullRequest.dhall

let PullRequestReview = ./events/PullRequestReview.dhall

let PullRequestReviewComment = ./events/PullRequestReviewComment.dhall

let Delete = ./events/Delete.dhall

let Schedule = ./events/Schedule.dhall

let RepositoryDispatch = ./events/RepositoryDispatch.dhall

let WorkflowCall = ./events/WorkflowCall.dhall

let WorkflowDispatch = ./events/WorkflowDispatch.dhall

let WorkflowRun = ./events/WorkflowRun.dhall

let Release = ./events/Release.dhall

let MergeGroup = ./events/MergeGroup.dhall

let PullRequestTarget = ./events/PullRequestTarget.dhall

in  { issue_comment : Optional IssueComment
    , issues : Optional Issues
    , push : Optional Push
    , pull_request : Optional PullRequest
    , pull_request_review : Optional PullRequestReview
    , pull_request_review_comment : Optional PullRequestReviewComment
    , pull_request_target : Optional PullRequestTarget
    , delete : Optional Delete
    , schedule : Optional (List Schedule)
    , repository_dispatch : Optional RepositoryDispatch
    , workflow_call : Optional WorkflowCall
    , workflow_dispatch : Optional WorkflowDispatch
    , workflow_run : Optional WorkflowRun
    , release : Optional Release
    , merge_group : Optional MergeGroup
    }
