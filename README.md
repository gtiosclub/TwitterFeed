# TwitterFeed

#### Outline
The goal of this is to have everyone in the room have their own working app by the end of the day. We'll first guide them through a simple tutorial to create a tableview and authentication, do a little bit of design and animation, and then finally finish with the last hour dedicated to each individual's ideas (given constraints). The 4 hour breakdown is as follows:

| Time          | What                                                    |
|---------------|---------------------------------------------------------|
| 6PM - 7PM     | TableViewController                                     |
| 7PM - 8PM     | OAuthentication and Rest Calls pull information         |
| 8PM - 9PM     | Using REST Calls to make a POST Update                  |
| 9PM - 10PM    | Building your own Twitter App                           |

With hour #4, we want to give them the tools to pull specific hashtagged information. They get to choose which hashtag to research into, but we should generally give them the code on how to make a REST Call for a specific hashtag.


Tentative storyboard Layout should be:

```
NavigationVC -> AuthenticationVC -> TabBarVC -> HomeFeedVC -> TweetVC
                                             -> UserFeedVC -> TweetVC
```

#### Limitations
There are two initial buckets available for GET requests: 15 calls every 15 minutes, and 180 calls every 15 minutes.
Search is rate limited at 180 queries per 15 minute window.

https://dev.twitter.com/rest/public/rate-limits

#### HomeFeedVC (To pull general tweets)
https://dev.twitter.com/rest/reference/get/statuses/home_timeline
Should just be a tableview with general twitter

#### UserFeedVC (To pull user tweets specified by handle)
https://dev.twitter.com/rest/reference/get/statuses/user_timeline
Should just be a tableview with user's tweets

#### TweetVC (To make a tweet)
https://dev.twitter.com/rest/reference/post/statuses/update
