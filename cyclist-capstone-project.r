{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "53168cbd",
   "metadata": {
    "papermill": {
     "duration": 0.005304,
     "end_time": "2023-04-25T19:13:54.323556",
     "exception": false,
     "start_time": "2023-04-25T19:13:54.318252",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Introduction:\n",
    "\n",
    "This case study is about a fictional  a Cyclistic bike-share company analysis! In this case study, you will perform many real-world tasks of a junior data analyst. You will work with Cyclistic, and meet different characters and team members. In order to answer the key business questions, you will follow the steps of the data analysis process: `ask, prepare, process, analyze, share, and act`. Along the way, the Case Study Roadmap tables — including guiding questions and key tasks — will help you stay on the right path.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e8e514f8",
   "metadata": {
    "papermill": {
     "duration": 0.003745,
     "end_time": "2023-04-25T19:13:54.331414",
     "exception": false,
     "start_time": "2023-04-25T19:13:54.327669",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "# 1. ASK\n",
    "\n",
    "## Key Objectives:\n",
    "\n",
    "\n",
    "### 1. Statement of the business task:\n",
    "Business wants to discover how casual riders and Cyclistic members use their rental bikes differently.The director of marketing believes the company’s future success depends on maximizing the number of annual memberships.Data analyst team will  design a new marketing strategy to convert casual riders into annual members. \n",
    "```\n",
    "```\n",
    "#### Stakeholders:\n",
    "* Cyclistic executive team\n",
    "* Director of Marketing (Lily Moreno)\n",
    "* Marketing Analytics team"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b0fb5b20",
   "metadata": {
    "papermill": {
     "duration": 0.003817,
     "end_time": "2023-04-25T19:13:54.339083",
     "exception": false,
     "start_time": "2023-04-25T19:13:54.335266",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 2. Prepare\n",
    "\n",
    "## Key Objectives:\n",
    "\n",
    "\n",
    "### Data Source & Credibility\n",
    "\n",
    "The data utilized in this analysis is sourced from Tripdata, an open-source provider, encompassing the period from 2013 up to three months into 2023. The file names are not standardized and may be sorted by quarter, month, or the entire year, and the column names may vary. Moreover, some columns have been added or removed over time. Despite these variations, the data quality appears to be reliable, as it was originally collected by the company and features a considerable number of entries containing valuable information.\n",
    "\n",
    "### Sort and filter the data:\n",
    "\n",
    "For this analysis I'm going to focus on the 2022-2023 period as it's the more relevant period to the business task.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "374abf9a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:13:54.351859Z",
     "iopub.status.busy": "2023-04-25T19:13:54.349284Z",
     "iopub.status.idle": "2023-04-25T19:14:13.143625Z",
     "shell.execute_reply": "2023-04-25T19:14:13.141376Z"
    },
    "papermill": {
     "duration": 18.803927,
     "end_time": "2023-04-25T19:14:13.146824",
     "exception": false,
     "start_time": "2023-04-25T19:13:54.342897",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.1.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "install.packages('tidyverse')\n",
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "b63ab96e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:14:13.195139Z",
     "iopub.status.busy": "2023-04-25T19:14:13.158511Z",
     "iopub.status.idle": "2023-04-25T19:16:35.575597Z",
     "shell.execute_reply": "2023-04-25T19:16:35.573173Z"
    },
    "papermill": {
     "duration": 142.426939,
     "end_time": "2023-04-25T19:16:35.578445",
     "exception": false,
     "start_time": "2023-04-25T19:14:13.151506",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Loading individual file to thier respective variables\n",
    "\n",
    "tripdata_202203<- read.csv(\"../input/bike-sharing-company-riders-dataset/202203-divvy-tripdata.csv\")\n",
    "tripdata_202204<- read.csv(\"../input/bike-sharing-company-riders-dataset/202204-divvy-tripdata.csv\")\n",
    "tripdata_202205<- read.csv(\"../input/bike-sharing-company-riders-dataset/202205-divvy-tripdata.csv\")\n",
    "tripdata_202206<- read.csv(\"../input/bike-sharing-company-riders-dataset/202206-divvy-tripdata.csv\")\n",
    "tripdata_202207<- read.csv(\"../input/bike-sharing-company-riders-dataset/202207-divvy-tripdata.csv\")\n",
    "tripdata_202208<- read.csv(\"../input/bike-sharing-company-riders-dataset/202208-divvy-tripdata.csv\")\n",
    "tripdata_202209<- read.csv(\"../input/bike-sharing-company-riders-dataset/202209-divvy-tripdata.csv\")\n",
    "tripdata_202210<- read.csv(\"../input/bike-sharing-company-riders-dataset/202210-divvy-tripdata.csv\")\n",
    "tripdata_202211<- read.csv(\"../input/bike-sharing-company-riders-dataset/202211-divvy-tripdata.csv\")\n",
    "tripdata_202212<- read.csv(\"../input/bike-sharing-company-riders-dataset/202212-divvy-tripdata.csv\")\n",
    "tripdata_202301<- read.csv(\"../input/bike-sharing-company-riders-dataset/202301-divvy-tripdata.csv\")\n",
    "tripdata_202302<- read.csv(\"../input/bike-sharing-company-riders-dataset/202302-divvy-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "c55f8c74",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:16:35.598186Z",
     "iopub.status.busy": "2023-04-25T19:16:35.596224Z",
     "iopub.status.idle": "2023-04-25T19:16:35.691563Z",
     "shell.execute_reply": "2023-04-25T19:16:35.689348Z"
    },
    "papermill": {
     "duration": 0.111252,
     "end_time": "2023-04-25T19:16:35.694383",
     "exception": false,
     "start_time": "2023-04-25T19:16:35.583131",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Lets check column names of each file\n",
    "\n",
    "colnames(tripdata_202203)\n",
    "colnames(tripdata_202204)\n",
    "colnames(tripdata_202205)\n",
    "colnames(tripdata_202206)\n",
    "colnames(tripdata_202207)\n",
    "colnames(tripdata_202208)\n",
    "colnames(tripdata_202209)\n",
    "colnames(tripdata_202210)\n",
    "colnames(tripdata_202211)\n",
    "colnames(tripdata_202212)\n",
    "colnames(tripdata_202301)\n",
    "colnames(tripdata_202302)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "6dea4f4b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:16:35.712069Z",
     "iopub.status.busy": "2023-04-25T19:16:35.710020Z",
     "iopub.status.idle": "2023-04-25T19:16:36.041464Z",
     "shell.execute_reply": "2023-04-25T19:16:36.038423Z"
    },
    "papermill": {
     "duration": 0.344572,
     "end_time": "2023-04-25T19:16:36.045687",
     "exception": false,
     "start_time": "2023-04-25T19:16:35.701115",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t284042 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"47EC0A7F82E65D52\" \"8494861979B0F477\" \"EFE527AF80B66109\" \"9F446FD9DEE3F389\" ...\n",
      " $ rideable_type     : chr  \"classic_bike\" \"electric_bike\" \"classic_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr  \"2022-03-21 13:45:01\" \"2022-03-16 09:37:16\" \"2022-03-23 19:52:02\" \"2022-03-01 19:12:26\" ...\n",
      " $ ended_at          : chr  \"2022-03-21 13:51:18\" \"2022-03-16 09:43:34\" \"2022-03-23 19:54:48\" \"2022-03-01 19:22:14\" ...\n",
      " $ start_station_name: chr  \"Wabash Ave & Wacker Pl\" \"Michigan Ave & Oak St\" \"Broadway & Berwyn Ave\" \"Wabash Ave & Wacker Pl\" ...\n",
      " $ start_station_id  : chr  \"TA1307000131\" \"13042\" \"13109\" \"TA1307000131\" ...\n",
      " $ end_station_name  : chr  \"Kingsbury St & Kinzie St\" \"Orleans St & Chestnut St (NEXT Apts)\" \"Broadway & Ridge Ave\" \"Franklin St & Jackson Blvd\" ...\n",
      " $ end_station_id    : chr  \"KA1503000043\" \"620\" \"15578\" \"TA1305000025\" ...\n",
      " $ start_lat         : num  41.9 41.9 42 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.7 -87.6 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 42 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.7 -87.6 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n",
      "'data.frame':\t371249 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"3564070EEFD12711\" \"0B820C7FCF22F489\" \"89EEEE32293F07FF\" \"84D4751AEB31888D\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"classic_bike\" \"classic_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr  \"2022-04-06 17:42:48\" \"2022-04-24 19:23:07\" \"2022-04-20 19:29:08\" \"2022-04-22 21:14:06\" ...\n",
      " $ ended_at          : chr  \"2022-04-06 17:54:36\" \"2022-04-24 19:43:17\" \"2022-04-20 19:35:16\" \"2022-04-22 21:23:29\" ...\n",
      " $ start_station_name: chr  \"Paulina St & Howard St\" \"Wentworth Ave & Cermak Rd\" \"Halsted St & Polk St\" \"Wentworth Ave & Cermak Rd\" ...\n",
      " $ start_station_id  : chr  \"515\" \"13075\" \"TA1307000121\" \"13075\" ...\n",
      " $ end_station_name  : chr  \"University Library (NU)\" \"Green St & Madison St\" \"Green St & Madison St\" \"Delano Ct & Roosevelt Rd\" ...\n",
      " $ end_station_id    : chr  \"605\" \"TA1307000120\" \"TA1307000120\" \"KA1706005007\" ...\n",
      " $ start_lat         : num  42 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num  42.1 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"casual\" ...\n",
      "'data.frame':\t634858 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"EC2DE40644C6B0F4\" \"1C31AD03897EE385\" \"1542FBEC830415CF\" \"6FF59852924528F8\" ...\n",
      " $ rideable_type     : chr  \"classic_bike\" \"classic_bike\" \"classic_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr  \"2022-05-23 23:06:58\" \"2022-05-11 08:53:28\" \"2022-05-26 18:36:28\" \"2022-05-10 07:30:07\" ...\n",
      " $ ended_at          : chr  \"2022-05-23 23:40:19\" \"2022-05-11 09:31:22\" \"2022-05-26 18:58:18\" \"2022-05-10 07:38:49\" ...\n",
      " $ start_station_name: chr  \"Wabash Ave & Grand Ave\" \"DuSable Lake Shore Dr & Monroe St\" \"Clinton St & Madison St\" \"Clinton St & Madison St\" ...\n",
      " $ start_station_id  : chr  \"TA1307000117\" \"13300\" \"TA1305000032\" \"TA1305000032\" ...\n",
      " $ end_station_name  : chr  \"Halsted St & Roscoe St\" \"Field Blvd & South Water St\" \"Wood St & Milwaukee Ave\" \"Clark St & Randolph St\" ...\n",
      " $ end_station_id    : chr  \"TA1309000025\" \"15534\" \"13221\" \"TA1305000030\" ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.7 -87.6 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n",
      "'data.frame':\t769204 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"600CFD130D0FD2A4\" \"F5E6B5C1682C6464\" \"B6EB6D27BAD771D2\" \"C9C320375DE1D5C6\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2022-06-30 17:27:53\" \"2022-06-30 18:39:52\" \"2022-06-30 11:49:25\" \"2022-06-30 11:15:25\" ...\n",
      " $ ended_at          : chr  \"2022-06-30 17:35:15\" \"2022-06-30 18:47:28\" \"2022-06-30 12:02:54\" \"2022-06-30 11:19:43\" ...\n",
      " $ start_station_name: chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_station_id  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.6 -87.7 -87.6 ...\n",
      " $ member_casual     : chr  \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t823488 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"954144C2F67B1932\" \"292E027607D218B6\" \"57765852588AD6E0\" \"B5B6BE44314590E6\" ...\n",
      " $ rideable_type     : chr  \"classic_bike\" \"classic_bike\" \"classic_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr  \"2022-07-05 08:12:47\" \"2022-07-26 12:53:38\" \"2022-07-03 13:58:49\" \"2022-07-31 17:44:21\" ...\n",
      " $ ended_at          : chr  \"2022-07-05 08:24:32\" \"2022-07-26 12:55:31\" \"2022-07-03 14:06:32\" \"2022-07-31 18:42:50\" ...\n",
      " $ start_station_name: chr  \"Ashland Ave & Blackhawk St\" \"Buckingham Fountain (Temp)\" \"Buckingham Fountain (Temp)\" \"Buckingham Fountain (Temp)\" ...\n",
      " $ start_station_id  : chr  \"13224\" \"15541\" \"15541\" \"15541\" ...\n",
      " $ end_station_name  : chr  \"Kingsbury St & Kinzie St\" \"Michigan Ave & 8th St\" \"Michigan Ave & 8th St\" \"Woodlawn Ave & 55th St\" ...\n",
      " $ end_station_id    : chr  \"KA1503000043\" \"623\" \"623\" \"TA1307000164\" ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.6 -87.6 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t785932 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"550CF7EFEAE0C618\" \"DAD198F405F9C5F5\" \"E6F2BC47B65CB7FD\" \"F597830181C2E13C\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2022-08-07 21:34:15\" \"2022-08-08 14:39:21\" \"2022-08-08 15:29:50\" \"2022-08-08 02:43:50\" ...\n",
      " $ ended_at          : chr  \"2022-08-07 21:41:46\" \"2022-08-08 14:53:23\" \"2022-08-08 15:40:34\" \"2022-08-08 02:58:53\" ...\n",
      " $ start_station_name: chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_station_id  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.9 41.9 42 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 42 42 41.8 ...\n",
      " $ end_lng           : num  -87.7 -87.6 -87.7 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t701339 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"5156990AC19CA285\" \"E12D4A16BF51C274\" \"A02B53CD7DB72DD7\" \"C82E05FEE872DF11\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2022-09-01 08:36:22\" \"2022-09-01 17:11:29\" \"2022-09-01 17:15:50\" \"2022-09-01 09:00:28\" ...\n",
      " $ ended_at          : chr  \"2022-09-01 08:39:05\" \"2022-09-01 17:14:45\" \"2022-09-01 17:16:12\" \"2022-09-01 09:10:32\" ...\n",
      " $ start_station_name: chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_station_id  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_name  : chr  \"California Ave & Milwaukee Ave\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"13084\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.6 -87.6 -87.7 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.7 -87.6 -87.6 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      "'data.frame':\t558685 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"A50255C1E17942AB\" \"DB692A70BD2DD4E3\" \"3C02727AAF60F873\" \"47E653FDC2D99236\" ...\n",
      " $ rideable_type     : chr  \"classic_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2022-10-14 17:13:30\" \"2022-10-01 16:29:26\" \"2022-10-19 18:55:40\" \"2022-10-31 07:52:36\" ...\n",
      " $ ended_at          : chr  \"2022-10-14 17:19:39\" \"2022-10-01 16:49:06\" \"2022-10-19 19:03:30\" \"2022-10-31 07:58:49\" ...\n",
      " $ start_station_name: chr  \"Noble St & Milwaukee Ave\" \"Damen Ave & Charleston St\" \"Hoyne Ave & Balmoral Ave\" \"Rush St & Cedar St\" ...\n",
      " $ start_station_id  : chr  \"13290\" \"13288\" \"655\" \"KA1504000133\" ...\n",
      " $ end_station_name  : chr  \"Larrabee St & Division St\" \"Damen Ave & Cullerton St\" \"Western Ave & Leland Ave\" \"Orleans St & Chestnut St (NEXT Apts)\" ...\n",
      " $ end_station_id    : chr  \"KA1504000079\" \"13089\" \"TA1307000140\" \"620\" ...\n",
      " $ start_lat         : num  41.9 41.9 42 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.6 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 42 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.7 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"casual\" \"member\" \"member\" ...\n",
      "'data.frame':\t337735 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"BCC66FC6FAB27CC7\" \"772AB67E902C180F\" \"585EAD07FDEC0152\" \"91C4E7ED3C262FF9\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"classic_bike\" \"classic_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr  \"2022-11-10 06:21:55\" \"2022-11-04 07:31:55\" \"2022-11-21 17:20:29\" \"2022-11-25 17:29:34\" ...\n",
      " $ ended_at          : chr  \"2022-11-10 06:31:27\" \"2022-11-04 07:46:25\" \"2022-11-21 17:34:36\" \"2022-11-25 17:45:15\" ...\n",
      " $ start_station_name: chr  \"Canal St & Adams St\" \"Canal St & Adams St\" \"Indiana Ave & Roosevelt Rd\" \"Indiana Ave & Roosevelt Rd\" ...\n",
      " $ start_station_id  : chr  \"13011\" \"13011\" \"SL-005\" \"SL-005\" ...\n",
      " $ end_station_name  : chr  \"St. Clair St & Erie St\" \"St. Clair St & Erie St\" \"St. Clair St & Erie St\" \"St. Clair St & Erie St\" ...\n",
      " $ end_station_id    : chr  \"13016\" \"13016\" \"13016\" \"13016\" ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.6 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n",
      "'data.frame':\t181806 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"65DBD2F447EC51C2\" \"0C201AA7EA0EA1AD\" \"E0B148CCB358A49D\" \"54C5775D2B7C9188\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"classic_bike\" \"electric_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr  \"2022-12-05 10:47:18\" \"2022-12-18 06:42:33\" \"2022-12-13 08:47:45\" \"2022-12-13 18:50:47\" ...\n",
      " $ ended_at          : chr  \"2022-12-05 10:56:34\" \"2022-12-18 07:08:44\" \"2022-12-13 08:59:51\" \"2022-12-13 19:19:48\" ...\n",
      " $ start_station_name: chr  \"Clifton Ave & Armitage Ave\" \"Broadway & Belmont Ave\" \"Sangamon St & Lake St\" \"Shields Ave & 31st St\" ...\n",
      " $ start_station_id  : chr  \"TA1307000163\" \"13277\" \"TA1306000015\" \"KA1503000038\" ...\n",
      " $ end_station_name  : chr  \"Sedgwick St & Webster Ave\" \"Sedgwick St & Webster Ave\" \"St. Clair St & Erie St\" \"Damen Ave & Madison St\" ...\n",
      " $ end_station_id    : chr  \"13191\" \"13191\" \"13016\" \"13134\" ...\n",
      " $ start_lat         : num  41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ start_lng         : num  -87.7 -87.6 -87.7 -87.6 -87.7 ...\n",
      " $ end_lat           : num  41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.6 -87.7 -87.7 ...\n",
      " $ member_casual     : chr  \"member\" \"casual\" \"member\" \"member\" ...\n",
      "'data.frame':\t190301 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"F96D5A74A3E41399\" \"13CB7EB698CEDB88\" \"BD88A2E670661CE5\" \"C90792D034FED968\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"classic_bike\" \"electric_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr  \"2023-01-21 20:05:42\" \"2023-01-10 15:37:36\" \"2023-01-02 07:51:57\" \"2023-01-22 10:52:58\" ...\n",
      " $ ended_at          : chr  \"2023-01-21 20:16:33\" \"2023-01-10 15:46:05\" \"2023-01-02 08:05:11\" \"2023-01-22 11:01:44\" ...\n",
      " $ start_station_name: chr  \"Lincoln Ave & Fullerton Ave\" \"Kimbark Ave & 53rd St\" \"Western Ave & Lunt Ave\" \"Kimbark Ave & 53rd St\" ...\n",
      " $ start_station_id  : chr  \"TA1309000058\" \"TA1309000037\" \"RP-005\" \"TA1309000037\" ...\n",
      " $ end_station_name  : chr  \"Hampden Ct & Diversey Ave\" \"Greenwood Ave & 47th St\" \"Valli Produce - Evanston Plaza\" \"Greenwood Ave & 47th St\" ...\n",
      " $ end_station_id    : chr  \"202480.0\" \"TA1308000002\" \"599\" \"TA1308000002\" ...\n",
      " $ start_lat         : num  41.9 41.8 42 41.8 41.8 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.7 -87.6 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.8 42 41.8 41.8 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"casual\" \"member\" ...\n",
      "'data.frame':\t190445 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"CBCD0D7777F0E45F\" \"F3EC5FCE5FF39DE9\" \"E54C1F27FA9354FF\" \"3D561E04F739CC45\" ...\n",
      " $ rideable_type     : chr  \"classic_bike\" \"electric_bike\" \"classic_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2023-02-14 11:59:42\" \"2023-02-15 13:53:48\" \"2023-02-19 11:10:57\" \"2023-02-26 16:12:05\" ...\n",
      " $ ended_at          : chr  \"2023-02-14 12:13:38\" \"2023-02-15 13:59:08\" \"2023-02-19 11:35:01\" \"2023-02-26 16:39:55\" ...\n",
      " $ start_station_name: chr  \"Southport Ave & Clybourn Ave\" \"Clarendon Ave & Gordon Ter\" \"Southport Ave & Clybourn Ave\" \"Southport Ave & Clybourn Ave\" ...\n",
      " $ start_station_id  : chr  \"TA1309000030\" \"13379\" \"TA1309000030\" \"TA1309000030\" ...\n",
      " $ end_station_name  : chr  \"Clark St & Schiller St\" \"Sheridan Rd & Lawrence Ave\" \"Aberdeen St & Monroe St\" \"Franklin St & Adams St (Temp)\" ...\n",
      " $ end_station_id    : chr  \"TA1309000024\" \"TA1309000041\" \"13156\" \"TA1309000008\" ...\n",
      " $ start_lat         : num  41.9 42 41.9 41.9 41.8 ...\n",
      " $ start_lng         : num  -87.7 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.9 42 41.9 41.9 41.8 ...\n",
      " $ end_lng           : num  -87.6 -87.7 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"casual\" \"casual\" \"member\" \"member\" ...\n"
     ]
    }
   ],
   "source": [
    "# Lets check the structure of columns as well\n",
    "\n",
    "str(tripdata_202203)\n",
    "str(tripdata_202204)\n",
    "str(tripdata_202205)\n",
    "str(tripdata_202206)\n",
    "str(tripdata_202207)\n",
    "str(tripdata_202208)\n",
    "str(tripdata_202209)\n",
    "str(tripdata_202210)\n",
    "str(tripdata_202211)\n",
    "str(tripdata_202212)\n",
    "str(tripdata_202301)\n",
    "str(tripdata_202302)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "895c51b4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:16:36.065353Z",
     "iopub.status.busy": "2023-04-25T19:16:36.063336Z",
     "iopub.status.idle": "2023-04-25T19:16:56.692433Z",
     "shell.execute_reply": "2023-04-25T19:16:56.690192Z"
    },
    "papermill": {
     "duration": 20.642719,
     "end_time": "2023-04-25T19:16:56.695931",
     "exception": false,
     "start_time": "2023-04-25T19:16:36.053212",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Lets combine all the files into one..\n",
    "library(dplyr)\n",
    "tripdata_all<- bind_rows(tripdata_202203,tripdata_202204,tripdata_202205,tripdata_202206,tripdata_202208,tripdata_202209,tripdata_202210,tripdata_202211,tripdata_202212,tripdata_202301,tripdata_202302)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "08aeb7fe",
   "metadata": {
    "papermill": {
     "duration": 0.007431,
     "end_time": "2023-04-25T19:16:56.710592",
     "exception": false,
     "start_time": "2023-04-25T19:16:56.703161",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 3. Process\n",
    "\n",
    "## Key objectives:\n",
    "\n",
    "### Cleaning the data and preparing it for the analysis:\n",
    "\n",
    "After binding the data in one dataframe, i would check any missing values and clean them. I will also use existing column to make new columns to further my analysis."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "a167d731",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:16:56.729486Z",
     "iopub.status.busy": "2023-04-25T19:16:56.727613Z",
     "iopub.status.idle": "2023-04-25T19:17:01.530820Z",
     "shell.execute_reply": "2023-04-25T19:17:01.527976Z"
    },
    "papermill": {
     "duration": 4.816557,
     "end_time": "2023-04-25T19:17:01.534421",
     "exception": false,
     "start_time": "2023-04-25T19:16:56.717864",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 5,005,596\n",
      "Columns: 13\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"47EC0A7F82E65D52\", \"8494861979B0F477\", \"EFE527AF80…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"classic_bike\", \"electric_bike\", \"classic_bike\", \"c…\n",
      "$ started_at         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2022-03-21 13:45:01\", \"2022-03-16 09:37:16\", \"2022…\n",
      "$ ended_at           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2022-03-21 13:51:18\", \"2022-03-16 09:43:34\", \"2022…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Wabash Ave & Wacker Pl\", \"Michigan Ave & Oak St\", …\n",
      "$ start_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"TA1307000131\", \"13042\", \"13109\", \"TA1307000131\", \"…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Kingsbury St & Kinzie St\", \"Orleans St & Chestnut …\n",
      "$ end_station_id     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"KA1503000043\", \"620\", \"15578\", \"TA1305000025\", \"13…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.88688, 41.90100, 41.97835, 41.88688, 41.91172, 4…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.62603, -87.62375, -87.65975, -87.62603, -87.626…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.88918, 41.89820, 41.98404, 41.87771, 41.87794, 4…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.63851, -87.63754, -87.66027, -87.63532, -87.662…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"member\", \"member\", \"member\", \"member\", \"member\", \"…\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5005596     Length:5005596     Length:5005596     Length:5005596    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5005596     Length:5005596     Length:5005596     Length:5005596    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   : 0.00   Min.   :-88.14  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :42.07   Max.   :-87.52   Max.   :42.15   Max.   :  0.00  \n",
       "                                  NA's   :4991    NA's   :4991    \n",
       " member_casual     \n",
       " Length:5005596    \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>47EC0A7F82E65D52</td><td>classic_bike </td><td>2022-03-21 13:45:01</td><td>2022-03-21 13:51:18</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td>TA1307000131</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St            </span></td><td>KA1503000043</td><td>41.88688</td><td>-87.62603</td><td>41.88918</td><td>-87.63851</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>8494861979B0F477</td><td>electric_bike</td><td>2022-03-16 09:37:16</td><td>2022-03-16 09:43:34</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St             </span></td><td><span style=white-space:pre-wrap>13042       </span></td><td>Orleans St &amp; Chestnut St (NEXT Apts)</td><td><span style=white-space:pre-wrap>620         </span></td><td>41.90100</td><td>-87.62375</td><td>41.89820</td><td>-87.63754</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>EFE527AF80B66109</td><td>classic_bike </td><td>2022-03-23 19:52:02</td><td>2022-03-23 19:54:48</td><td><span style=white-space:pre-wrap>Broadway &amp; Berwyn Ave             </span></td><td><span style=white-space:pre-wrap>13109       </span></td><td><span style=white-space:pre-wrap>Broadway &amp; Ridge Ave                </span></td><td><span style=white-space:pre-wrap>15578       </span></td><td>41.97835</td><td>-87.65975</td><td>41.98404</td><td>-87.66027</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>9F446FD9DEE3F389</td><td>classic_bike </td><td>2022-03-01 19:12:26</td><td>2022-03-01 19:22:14</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td>TA1307000131</td><td><span style=white-space:pre-wrap>Franklin St &amp; Jackson Blvd          </span></td><td>TA1305000025</td><td>41.88688</td><td>-87.62603</td><td>41.87771</td><td>-87.63532</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>431128AD9AFFEDC0</td><td>classic_bike </td><td>2022-03-21 18:37:01</td><td>2022-03-21 19:19:11</td><td>DuSable Lake Shore Dr &amp; North Blvd</td><td><span style=white-space:pre-wrap>LF-005      </span></td><td><span style=white-space:pre-wrap>Loomis St &amp; Jackson Blvd            </span></td><td><span style=white-space:pre-wrap>13206       </span></td><td>41.91172</td><td>-87.62680</td><td>41.87794</td><td>-87.66201</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>9AA8A13AF7A85325</td><td>classic_bike </td><td>2022-03-07 17:10:22</td><td>2022-03-07 17:15:04</td><td><span style=white-space:pre-wrap>Bissell St &amp; Armitage Ave         </span></td><td><span style=white-space:pre-wrap>13059       </span></td><td><span style=white-space:pre-wrap>Southport Ave &amp; Clybourn Ave        </span></td><td>TA1309000030</td><td>41.91802</td><td>-87.65218</td><td>41.92077</td><td>-87.66371</td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 47EC0A7F82E65D52 & classic\\_bike  & 2022-03-21 13:45:01 & 2022-03-21 13:51:18 & Wabash Ave \\& Wacker Pl             & TA1307000131 & Kingsbury St \\& Kinzie St             & KA1503000043 & 41.88688 & -87.62603 & 41.88918 & -87.63851 & member\\\\\n",
       "\t2 & 8494861979B0F477 & electric\\_bike & 2022-03-16 09:37:16 & 2022-03-16 09:43:34 & Michigan Ave \\& Oak St              & 13042        & Orleans St \\& Chestnut St (NEXT Apts) & 620          & 41.90100 & -87.62375 & 41.89820 & -87.63754 & member\\\\\n",
       "\t3 & EFE527AF80B66109 & classic\\_bike  & 2022-03-23 19:52:02 & 2022-03-23 19:54:48 & Broadway \\& Berwyn Ave              & 13109        & Broadway \\& Ridge Ave                 & 15578        & 41.97835 & -87.65975 & 41.98404 & -87.66027 & member\\\\\n",
       "\t4 & 9F446FD9DEE3F389 & classic\\_bike  & 2022-03-01 19:12:26 & 2022-03-01 19:22:14 & Wabash Ave \\& Wacker Pl             & TA1307000131 & Franklin St \\& Jackson Blvd           & TA1305000025 & 41.88688 & -87.62603 & 41.87771 & -87.63532 & member\\\\\n",
       "\t5 & 431128AD9AFFEDC0 & classic\\_bike  & 2022-03-21 18:37:01 & 2022-03-21 19:19:11 & DuSable Lake Shore Dr \\& North Blvd & LF-005       & Loomis St \\& Jackson Blvd             & 13206        & 41.91172 & -87.62680 & 41.87794 & -87.66201 & member\\\\\n",
       "\t6 & 9AA8A13AF7A85325 & classic\\_bike  & 2022-03-07 17:10:22 & 2022-03-07 17:15:04 & Bissell St \\& Armitage Ave          & 13059        & Southport Ave \\& Clybourn Ave         & TA1309000030 & 41.91802 & -87.65218 & 41.92077 & -87.66371 & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 47EC0A7F82E65D52 | classic_bike  | 2022-03-21 13:45:01 | 2022-03-21 13:51:18 | Wabash Ave &amp; Wacker Pl             | TA1307000131 | Kingsbury St &amp; Kinzie St             | KA1503000043 | 41.88688 | -87.62603 | 41.88918 | -87.63851 | member |\n",
       "| 2 | 8494861979B0F477 | electric_bike | 2022-03-16 09:37:16 | 2022-03-16 09:43:34 | Michigan Ave &amp; Oak St              | 13042        | Orleans St &amp; Chestnut St (NEXT Apts) | 620          | 41.90100 | -87.62375 | 41.89820 | -87.63754 | member |\n",
       "| 3 | EFE527AF80B66109 | classic_bike  | 2022-03-23 19:52:02 | 2022-03-23 19:54:48 | Broadway &amp; Berwyn Ave              | 13109        | Broadway &amp; Ridge Ave                 | 15578        | 41.97835 | -87.65975 | 41.98404 | -87.66027 | member |\n",
       "| 4 | 9F446FD9DEE3F389 | classic_bike  | 2022-03-01 19:12:26 | 2022-03-01 19:22:14 | Wabash Ave &amp; Wacker Pl             | TA1307000131 | Franklin St &amp; Jackson Blvd           | TA1305000025 | 41.88688 | -87.62603 | 41.87771 | -87.63532 | member |\n",
       "| 5 | 431128AD9AFFEDC0 | classic_bike  | 2022-03-21 18:37:01 | 2022-03-21 19:19:11 | DuSable Lake Shore Dr &amp; North Blvd | LF-005       | Loomis St &amp; Jackson Blvd             | 13206        | 41.91172 | -87.62680 | 41.87794 | -87.66201 | member |\n",
       "| 6 | 9AA8A13AF7A85325 | classic_bike  | 2022-03-07 17:10:22 | 2022-03-07 17:15:04 | Bissell St &amp; Armitage Ave          | 13059        | Southport Ave &amp; Clybourn Ave         | TA1309000030 | 41.91802 | -87.65218 | 41.92077 | -87.66371 | member |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 47EC0A7F82E65D52 classic_bike  2022-03-21 13:45:01 2022-03-21 13:51:18\n",
       "2 8494861979B0F477 electric_bike 2022-03-16 09:37:16 2022-03-16 09:43:34\n",
       "3 EFE527AF80B66109 classic_bike  2022-03-23 19:52:02 2022-03-23 19:54:48\n",
       "4 9F446FD9DEE3F389 classic_bike  2022-03-01 19:12:26 2022-03-01 19:22:14\n",
       "5 431128AD9AFFEDC0 classic_bike  2022-03-21 18:37:01 2022-03-21 19:19:11\n",
       "6 9AA8A13AF7A85325 classic_bike  2022-03-07 17:10:22 2022-03-07 17:15:04\n",
       "  start_station_name                 start_station_id\n",
       "1 Wabash Ave & Wacker Pl             TA1307000131    \n",
       "2 Michigan Ave & Oak St              13042           \n",
       "3 Broadway & Berwyn Ave              13109           \n",
       "4 Wabash Ave & Wacker Pl             TA1307000131    \n",
       "5 DuSable Lake Shore Dr & North Blvd LF-005          \n",
       "6 Bissell St & Armitage Ave          13059           \n",
       "  end_station_name                     end_station_id start_lat start_lng\n",
       "1 Kingsbury St & Kinzie St             KA1503000043   41.88688  -87.62603\n",
       "2 Orleans St & Chestnut St (NEXT Apts) 620            41.90100  -87.62375\n",
       "3 Broadway & Ridge Ave                 15578          41.97835  -87.65975\n",
       "4 Franklin St & Jackson Blvd           TA1305000025   41.88688  -87.62603\n",
       "5 Loomis St & Jackson Blvd             13206          41.91172  -87.62680\n",
       "6 Southport Ave & Clybourn Ave         TA1309000030   41.91802  -87.65218\n",
       "  end_lat  end_lng   member_casual\n",
       "1 41.88918 -87.63851 member       \n",
       "2 41.89820 -87.63754 member       \n",
       "3 41.98404 -87.66027 member       \n",
       "4 41.87771 -87.63532 member       \n",
       "5 41.87794 -87.66201 member       \n",
       "6 41.92077 -87.66371 member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Glimpse & Summary of data\n",
    "glimpse(tripdata_all)\n",
    "summary(tripdata_all)\n",
    "head(tripdata_all)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "8ec87adf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:17:01.557294Z",
     "iopub.status.busy": "2023-04-25T19:17:01.555364Z",
     "iopub.status.idle": "2023-04-25T19:18:33.917545Z",
     "shell.execute_reply": "2023-04-25T19:18:33.915372Z"
    },
    "papermill": {
     "duration": 92.37964,
     "end_time": "2023-04-25T19:18:33.922142",
     "exception": false,
     "start_time": "2023-04-25T19:17:01.542502",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#install.packages(\"geosphere\")\n",
    "library(geosphere)\n",
    "# Lets first clean NA in the data.\n",
    "tripdata_cleaned<- drop_na(tripdata_all)\n",
    "\n",
    "# Change started_at column into multiple columsn seperating the month , day, and year\n",
    "tripdata_cleaned$date      <- as.Date(tripdata_cleaned$started_at)\n",
    "tripdata_cleaned$month     <- format(as.Date(tripdata_cleaned$date), \"%m\")\n",
    "tripdata_cleaned$day       <- format(as.Date(tripdata_cleaned$date), \"%d\")\n",
    "tripdata_cleaned$year      <- format(as.Date(tripdata_cleaned$date), \"%y\")\n",
    "tripdata_cleaned$week_days <- format(as.Date(tripdata_cleaned$date), \"%A\")\n",
    "\n",
    "# Find the cycleing time\n",
    "tripdata_cleaned$cycling_time <- difftime(tripdata_cleaned$ended_at, tripdata_cleaned$started_at)\n",
    "\n",
    "# Find the distance covered\n",
    "tripdata_cleaned$distance_covered <- distGeo(matrix(c(tripdata_cleaned$start_lng, tripdata_cleaned$start_lat), ncol = 2), matrix(c(tripdata_cleaned$end_lng, tripdata_cleaned$end_lat), ncol = 2))\n",
    "tripdata_cleaned$distance_covered<- tripdata_cleaned$distance_covered/1000\n",
    "\n",
    "# speed to cover the distance\n",
    "tripdata_cleaned$speed <- c(tripdata_cleaned$distance_covered)/as.numeric(c(tripdata_cleaned$cycling_time), units=\"hours\")\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "f68d8c46",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:18:33.948307Z",
     "iopub.status.busy": "2023-04-25T19:18:33.945624Z",
     "iopub.status.idle": "2023-04-25T19:18:33.999169Z",
     "shell.execute_reply": "2023-04-25T19:18:33.996175Z"
    },
    "papermill": {
     "duration": 0.067851,
     "end_time": "2023-04-25T19:18:34.002671",
     "exception": false,
     "start_time": "2023-04-25T19:18:33.934820",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 21</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>⋯</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>day</th><th scope=col>year</th><th scope=col>week_days</th><th scope=col>cycling_time</th><th scope=col>distance_covered</th><th scope=col>speed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>⋯</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>47EC0A7F82E65D52</td><td>classic_bike </td><td>2022-03-21 13:45:01</td><td>2022-03-21 13:51:18</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td>TA1307000131</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St            </span></td><td>KA1503000043</td><td>41.88688</td><td>-87.62603</td><td>⋯</td><td>-87.63851</td><td>member</td><td>2022-03-21</td><td>03</td><td>21</td><td>22</td><td><span style=white-space:pre-wrap>Monday   </span></td><td> 377 secs</td><td>1.0665346</td><td>10.184415</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>8494861979B0F477</td><td>electric_bike</td><td>2022-03-16 09:37:16</td><td>2022-03-16 09:43:34</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St             </span></td><td><span style=white-space:pre-wrap>13042       </span></td><td>Orleans St &amp; Chestnut St (NEXT Apts)</td><td><span style=white-space:pre-wrap>620         </span></td><td>41.90100</td><td>-87.62375</td><td>⋯</td><td>-87.63754</td><td>member</td><td>2022-03-16</td><td>03</td><td>16</td><td>22</td><td>Wednesday</td><td> 378 secs</td><td>1.1852061</td><td>11.287677</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>EFE527AF80B66109</td><td>classic_bike </td><td>2022-03-23 19:52:02</td><td>2022-03-23 19:54:48</td><td><span style=white-space:pre-wrap>Broadway &amp; Berwyn Ave             </span></td><td><span style=white-space:pre-wrap>13109       </span></td><td><span style=white-space:pre-wrap>Broadway &amp; Ridge Ave                </span></td><td><span style=white-space:pre-wrap>15578       </span></td><td>41.97835</td><td>-87.65975</td><td>⋯</td><td>-87.66027</td><td>member</td><td>2022-03-23</td><td>03</td><td>23</td><td>22</td><td>Wednesday</td><td> 166 secs</td><td>0.6336557</td><td>13.741930</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>9F446FD9DEE3F389</td><td>classic_bike </td><td>2022-03-01 19:12:26</td><td>2022-03-01 19:22:14</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Wacker Pl            </span></td><td>TA1307000131</td><td><span style=white-space:pre-wrap>Franklin St &amp; Jackson Blvd          </span></td><td>TA1305000025</td><td>41.88688</td><td>-87.62603</td><td>⋯</td><td>-87.63532</td><td>member</td><td>2022-03-01</td><td>03</td><td>01</td><td>22</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td> 588 secs</td><td>1.2772855</td><td> 7.820116</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>431128AD9AFFEDC0</td><td>classic_bike </td><td>2022-03-21 18:37:01</td><td>2022-03-21 19:19:11</td><td>DuSable Lake Shore Dr &amp; North Blvd</td><td><span style=white-space:pre-wrap>LF-005      </span></td><td><span style=white-space:pre-wrap>Loomis St &amp; Jackson Blvd            </span></td><td><span style=white-space:pre-wrap>13206       </span></td><td>41.91172</td><td>-87.62680</td><td>⋯</td><td>-87.66201</td><td>member</td><td>2022-03-21</td><td>03</td><td>21</td><td>22</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>2530 secs</td><td>4.7549382</td><td> 6.765920</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>9AA8A13AF7A85325</td><td>classic_bike </td><td>2022-03-07 17:10:22</td><td>2022-03-07 17:15:04</td><td><span style=white-space:pre-wrap>Bissell St &amp; Armitage Ave         </span></td><td><span style=white-space:pre-wrap>13059       </span></td><td><span style=white-space:pre-wrap>Southport Ave &amp; Clybourn Ave        </span></td><td>TA1309000030</td><td>41.91802</td><td>-87.65218</td><td>⋯</td><td>-87.66371</td><td>member</td><td>2022-03-07</td><td>03</td><td>07</td><td>22</td><td><span style=white-space:pre-wrap>Monday   </span></td><td> 282 secs</td><td>1.0041599</td><td>12.819062</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 21\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & ⋯ & end\\_lng & member\\_casual & date & month & day & year & week\\_days & cycling\\_time & distance\\_covered & speed\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & ⋯ & <dbl> & <chr> & <date> & <chr> & <chr> & <chr> & <chr> & <drtn> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 47EC0A7F82E65D52 & classic\\_bike  & 2022-03-21 13:45:01 & 2022-03-21 13:51:18 & Wabash Ave \\& Wacker Pl             & TA1307000131 & Kingsbury St \\& Kinzie St             & KA1503000043 & 41.88688 & -87.62603 & ⋯ & -87.63851 & member & 2022-03-21 & 03 & 21 & 22 & Monday    &  377 secs & 1.0665346 & 10.184415\\\\\n",
       "\t2 & 8494861979B0F477 & electric\\_bike & 2022-03-16 09:37:16 & 2022-03-16 09:43:34 & Michigan Ave \\& Oak St              & 13042        & Orleans St \\& Chestnut St (NEXT Apts) & 620          & 41.90100 & -87.62375 & ⋯ & -87.63754 & member & 2022-03-16 & 03 & 16 & 22 & Wednesday &  378 secs & 1.1852061 & 11.287677\\\\\n",
       "\t3 & EFE527AF80B66109 & classic\\_bike  & 2022-03-23 19:52:02 & 2022-03-23 19:54:48 & Broadway \\& Berwyn Ave              & 13109        & Broadway \\& Ridge Ave                 & 15578        & 41.97835 & -87.65975 & ⋯ & -87.66027 & member & 2022-03-23 & 03 & 23 & 22 & Wednesday &  166 secs & 0.6336557 & 13.741930\\\\\n",
       "\t4 & 9F446FD9DEE3F389 & classic\\_bike  & 2022-03-01 19:12:26 & 2022-03-01 19:22:14 & Wabash Ave \\& Wacker Pl             & TA1307000131 & Franklin St \\& Jackson Blvd           & TA1305000025 & 41.88688 & -87.62603 & ⋯ & -87.63532 & member & 2022-03-01 & 03 & 01 & 22 & Tuesday   &  588 secs & 1.2772855 &  7.820116\\\\\n",
       "\t5 & 431128AD9AFFEDC0 & classic\\_bike  & 2022-03-21 18:37:01 & 2022-03-21 19:19:11 & DuSable Lake Shore Dr \\& North Blvd & LF-005       & Loomis St \\& Jackson Blvd             & 13206        & 41.91172 & -87.62680 & ⋯ & -87.66201 & member & 2022-03-21 & 03 & 21 & 22 & Monday    & 2530 secs & 4.7549382 &  6.765920\\\\\n",
       "\t6 & 9AA8A13AF7A85325 & classic\\_bike  & 2022-03-07 17:10:22 & 2022-03-07 17:15:04 & Bissell St \\& Armitage Ave          & 13059        & Southport Ave \\& Clybourn Ave         & TA1309000030 & 41.91802 & -87.65218 & ⋯ & -87.66371 & member & 2022-03-07 & 03 & 07 & 22 & Monday    &  282 secs & 1.0041599 & 12.819062\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 21\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | ⋯ ⋯ | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | day &lt;chr&gt; | year &lt;chr&gt; | week_days &lt;chr&gt; | cycling_time &lt;drtn&gt; | distance_covered &lt;dbl&gt; | speed &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 47EC0A7F82E65D52 | classic_bike  | 2022-03-21 13:45:01 | 2022-03-21 13:51:18 | Wabash Ave &amp; Wacker Pl             | TA1307000131 | Kingsbury St &amp; Kinzie St             | KA1503000043 | 41.88688 | -87.62603 | ⋯ | -87.63851 | member | 2022-03-21 | 03 | 21 | 22 | Monday    |  377 secs | 1.0665346 | 10.184415 |\n",
       "| 2 | 8494861979B0F477 | electric_bike | 2022-03-16 09:37:16 | 2022-03-16 09:43:34 | Michigan Ave &amp; Oak St              | 13042        | Orleans St &amp; Chestnut St (NEXT Apts) | 620          | 41.90100 | -87.62375 | ⋯ | -87.63754 | member | 2022-03-16 | 03 | 16 | 22 | Wednesday |  378 secs | 1.1852061 | 11.287677 |\n",
       "| 3 | EFE527AF80B66109 | classic_bike  | 2022-03-23 19:52:02 | 2022-03-23 19:54:48 | Broadway &amp; Berwyn Ave              | 13109        | Broadway &amp; Ridge Ave                 | 15578        | 41.97835 | -87.65975 | ⋯ | -87.66027 | member | 2022-03-23 | 03 | 23 | 22 | Wednesday |  166 secs | 0.6336557 | 13.741930 |\n",
       "| 4 | 9F446FD9DEE3F389 | classic_bike  | 2022-03-01 19:12:26 | 2022-03-01 19:22:14 | Wabash Ave &amp; Wacker Pl             | TA1307000131 | Franklin St &amp; Jackson Blvd           | TA1305000025 | 41.88688 | -87.62603 | ⋯ | -87.63532 | member | 2022-03-01 | 03 | 01 | 22 | Tuesday   |  588 secs | 1.2772855 |  7.820116 |\n",
       "| 5 | 431128AD9AFFEDC0 | classic_bike  | 2022-03-21 18:37:01 | 2022-03-21 19:19:11 | DuSable Lake Shore Dr &amp; North Blvd | LF-005       | Loomis St &amp; Jackson Blvd             | 13206        | 41.91172 | -87.62680 | ⋯ | -87.66201 | member | 2022-03-21 | 03 | 21 | 22 | Monday    | 2530 secs | 4.7549382 |  6.765920 |\n",
       "| 6 | 9AA8A13AF7A85325 | classic_bike  | 2022-03-07 17:10:22 | 2022-03-07 17:15:04 | Bissell St &amp; Armitage Ave          | 13059        | Southport Ave &amp; Clybourn Ave         | TA1309000030 | 41.91802 | -87.65218 | ⋯ | -87.66371 | member | 2022-03-07 | 03 | 07 | 22 | Monday    |  282 secs | 1.0041599 | 12.819062 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 47EC0A7F82E65D52 classic_bike  2022-03-21 13:45:01 2022-03-21 13:51:18\n",
       "2 8494861979B0F477 electric_bike 2022-03-16 09:37:16 2022-03-16 09:43:34\n",
       "3 EFE527AF80B66109 classic_bike  2022-03-23 19:52:02 2022-03-23 19:54:48\n",
       "4 9F446FD9DEE3F389 classic_bike  2022-03-01 19:12:26 2022-03-01 19:22:14\n",
       "5 431128AD9AFFEDC0 classic_bike  2022-03-21 18:37:01 2022-03-21 19:19:11\n",
       "6 9AA8A13AF7A85325 classic_bike  2022-03-07 17:10:22 2022-03-07 17:15:04\n",
       "  start_station_name                 start_station_id\n",
       "1 Wabash Ave & Wacker Pl             TA1307000131    \n",
       "2 Michigan Ave & Oak St              13042           \n",
       "3 Broadway & Berwyn Ave              13109           \n",
       "4 Wabash Ave & Wacker Pl             TA1307000131    \n",
       "5 DuSable Lake Shore Dr & North Blvd LF-005          \n",
       "6 Bissell St & Armitage Ave          13059           \n",
       "  end_station_name                     end_station_id start_lat start_lng ⋯\n",
       "1 Kingsbury St & Kinzie St             KA1503000043   41.88688  -87.62603 ⋯\n",
       "2 Orleans St & Chestnut St (NEXT Apts) 620            41.90100  -87.62375 ⋯\n",
       "3 Broadway & Ridge Ave                 15578          41.97835  -87.65975 ⋯\n",
       "4 Franklin St & Jackson Blvd           TA1305000025   41.88688  -87.62603 ⋯\n",
       "5 Loomis St & Jackson Blvd             13206          41.91172  -87.62680 ⋯\n",
       "6 Southport Ave & Clybourn Ave         TA1309000030   41.91802  -87.65218 ⋯\n",
       "  end_lng   member_casual date       month day year week_days cycling_time\n",
       "1 -87.63851 member        2022-03-21 03    21  22   Monday     377 secs   \n",
       "2 -87.63754 member        2022-03-16 03    16  22   Wednesday  378 secs   \n",
       "3 -87.66027 member        2022-03-23 03    23  22   Wednesday  166 secs   \n",
       "4 -87.63532 member        2022-03-01 03    01  22   Tuesday    588 secs   \n",
       "5 -87.66201 member        2022-03-21 03    21  22   Monday    2530 secs   \n",
       "6 -87.66371 member        2022-03-07 03    07  22   Monday     282 secs   \n",
       "  distance_covered speed    \n",
       "1 1.0665346        10.184415\n",
       "2 1.1852061        11.287677\n",
       "3 0.6336557        13.741930\n",
       "4 1.2772855         7.820116\n",
       "5 4.7549382         6.765920\n",
       "6 1.0041599        12.819062"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(tripdata_cleaned)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "4033454b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:18:34.024307Z",
     "iopub.status.busy": "2023-04-25T19:18:34.022228Z",
     "iopub.status.idle": "2023-04-25T19:18:34.047323Z",
     "shell.execute_reply": "2023-04-25T19:18:34.045047Z"
    },
    "papermill": {
     "duration": 0.039219,
     "end_time": "2023-04-25T19:18:34.050547",
     "exception": false,
     "start_time": "2023-04-25T19:18:34.011328",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "is.null(tripdata_cleaned)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2992043d",
   "metadata": {
    "papermill": {
     "duration": 0.008515,
     "end_time": "2023-04-25T19:18:34.067679",
     "exception": false,
     "start_time": "2023-04-25T19:18:34.059164",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 4. Analyze\n",
    "## Key objectives:\n",
    "1.Identify trends and relationships.:\n",
    "\n",
    "We have now a complete data frame with all the info we need to identify the differences in behaviour between the casual and the member users.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "759644ec",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-25T19:18:34.089523Z",
     "iopub.status.busy": "2023-04-25T19:18:34.087744Z",
     "iopub.status.idle": "2023-04-25T19:18:51.987964Z",
     "shell.execute_reply": "2023-04-25T19:18:51.985763Z"
    },
    "papermill": {
     "duration": 17.91469,
     "end_time": "2023-04-25T19:18:51.990825",
     "exception": false,
     "start_time": "2023-04-25T19:18:34.076135",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“package ‘gridextra’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Warning message:\n",
      "“Perhaps you meant ‘gridExtra’ ?”\n",
      "\n",
      "Attaching package: ‘gridExtra’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    combine\n",
      "\n",
      "\n",
      "\u001b[1m\u001b[22mDon't know how to automatically pick scale for object of type \u001b[34m<difftime>\u001b[39m.\n",
      "Defaulting to continuous.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n2PijGcY71Crxc4CA1b9bOgghuv2WcPuibe2qCiG2X8u2zclKiF+zdM7QF7oH1fQUQrj4tfwu\nKSvtwnwhRKOImG9v8+PeROuKMXW9nDzaF6WfAi/FyrI8tpqbS+Xesix/2sZfo6+eZMy7yOKs\nkvzbfHvL4DBfF4PfIFmWi9IbgAptc7Cve823bpl5YWdnSZISc80jartXbjH0652//LFv17zR\nrVQaj3M5JlmWczIzout41Bv0Q0ZGtizLhQ3Lz3optmql2pExG/b89O3MwU9IkmrK3oT0i0sk\nSdqWnPej8uPWVfweXX57n+09nB597/DWnrWqd9mUN8uSHWTQjv4r6ZUqrkFjfpVl85D6nm41\nOqze9P2vcVvGd6+n0Vf9KTXnllZlWXZWSeNOpVza1U+ldjmRabTO/D4swK3aqMK+yy1Fxrfw\n9Qrq/fGWHb//Ercg4hmV2rD8RAF3p+S/CvmgTu1XufL45V8d/fvYxuh+QojpZ1Jv35OFVfbU\nqFp3DJoe83X8P5fsVCti/9Y9UNges9+wnWN9x0uxhbZtyQkPcPdu0nfjtl17ftjYp66Hd+MJ\nt+/P/Ah2KC3Jx4cKIZpF/Xn7orFV3VRqgzVC5aYd++WXX05mGW1Lj26NFEI0GLbHmHVSLUkN\nhuzOv64xM37t2rVxlzKsk8UPdvFLnxBCxJ4/WVmrrhn6lW2+s0oy+A3IP9KUfcZNrfJtulqW\n5aL0BqBCKzDYXT0WJoT4Iz137juzv7qSdzNW1tXN4sZ9w/J/79myM8zGGuxC1/5jm/N6PU/v\nhu/JstzVy7nVgiOyLJtyzvto1UN+LeBXZWuwSz42QeNU67rJIsty8rHxWue6GWaLNdilnnpD\nCLHqfLp1vMV0vVUlffDk3+XbbmKzxhqzMclfrw7d+q8sy7Ilu7FB13ntP3a+i61I2vm5kqSy\nBSBZlqPre1XrsOX2nm/JNPVf+t62qImrrvPOC7fsSTuVPTWq+kN+sM23U+2O/dv2gJ09ZmcT\ndo51UYJdgTWvHhklqZzjUvK+eNr5JU888cSVXHt3eXIpFqXFvVZkoEF7aGafDX8m5J+/a9ng\n6PNpD7aJ9taohBAZCUtatmz53Kyb96zUbP6IEMKUYdI4BUxr6HUyNvyHy5m2pWtGdH/++efP\nlty/3Np93lJL0oShIYlG84C5T+ZflHH5w9e//PvGlGVtRI80s6XtjDZCiLLpDUB5k5N4TZKk\nqjr1q2OHuvz8+TtRU4YPeuGpli8UNr6Iw4QQIzv52z7/b0Cd9PPrhRDTBgYcnr1cCHFxx6hU\n7UNzm1UubHXPutODNBciDiUJIX6d9Jl/x2iXG28JuLI7TutS/0V/g3VSUruNC3A/t+FIYaVU\nGu/5ravsmbBZCJEcP/VIrtuSHjWK8l1Sjm2TZUtrd73tBpWxx5LTTh2z862t6gwOsn320ajE\nbbeZ2a8c0L9hUaoV/VjccY8VuImi1y9QgTXPf7XHyfPpNu4663xX/2E///xzZbt3H/GXJ1Ba\nVFrfbRumBnWb9uzD/sEduj1Sr45BpB3c/c2OP867Vu/w5ab+1mHuNad3qLzsh6jWXU8NaBlY\n25JyZtOKGLXWe9rbTYUQY7YuXl73hS51gnr2DW32kNfhHetit59o1D+2313eEWyHzr31q9Xc\n3t1yzMmj3ZQAj/yLDP7N5j8TGP/8wBYB7gfjPtsYd9q3xejYLtWtS8ugNwDlzbFlfzt5dvW0\nXPi/uoH7PZ4c8mzHJ7s9PnB02CNNCviTNuaccyH17zzMKv+7mnReOkmlF0I0HDc6fe6Qnamz\n9o3bWbPnWld14W90knTvhlbv/9qPS7aHjvv2fO/fWtmWyLL83/JCrZZk2d7bVdrO7ZX88KR/\nc4YdjPjswTaLaurVRfkuWndnlcYjI/1y/o1J0p2Tht7tDmPsV67kpbtjtbs6FnfcY7dv4q7q\nF6jAti05FknldPt8e+yczQOKL/X4dxEDegTWeMBZp3YyuD/UtPXIqGUX//uygMzLu0f26VDd\np5JGpXbzrtqmx6Av/kiyLU05/u3QHm38PFx1Ll71g594c/k3RsvNdYt/KVaW5WPLnhBCNJm4\nP/9MZ5VUq8eOk5tnP9bA30mj9apSL2zsvEv/PQFuvzcAFdrtl2Kzk/fUdNI0nbQ/8c9nJZXu\n8o0fCBkJH4uCLsXaH2ZjvRTb47NTtjmTA739Hv3I+rm7t/Oj0Z/oVdJ7Z68X2Kf1Uqwsyyn/\nRKr1/icPjdO6NMwyy7IsWy/FppyaLIT4+KLtwmLak+76xq/vlwu5FCvLsmzODDRoe207UstJ\nMyk+2f53sRXJuvq1JElzb95UZxnX/vF+MSdu7/mWq5C9jt78md/ew6lz3K2XYu1U9tSowo5d\nta1eWLWi9G/bA3b2WGGbsH+si3IptsC2r/zWX6V2s76ES5bljMur/fz8dqRky4Uj2AHy/olN\nJEnalPSfn7bWYOeolgA43OZgX9cHh+zatWvXrl0/7/zh08UzWvg6u9UMuZhjvn7uHSHE67E7\nzpw7tfubj0IC/YUQs/efsd4qv/Qhz2qdPrp0KdH+MBtrsNM4154V+9X+vT/MGdZWUunfj79m\nXfrbhCYqtdbF55nC+rQFO9libFlJXzfIo3avvAe/bjw8YRpU16NS7S5rtu48sHv7pF4NNPpq\ncSnZ+Vu1jr8Z7GT5u751nB+o7eTRztqtne+Sv8h7T1d19n3yg7VbDx7Y++6IxzVONb+/VkAK\nKWKwK0rlIga7IvZ/Yw8UuscK24T9Y33Pwc5iSutexeDbsv/mHft+37U1vLG3Z70RhfxDyEOw\nw/3OnJvYwk1XqfrYW+YT7ID73OZgX9vVLUnSePnVeWZo1PH0vCe9vn1neN2qPk6V/B7t8L9v\nj6cMal5Vo3M7nGGUZTl+cX9vF22l6v3sD7PJuLxCrXvw+8Xjmwc8oNe7Bz3afu6XJ28uTVgl\nhGjxzqHC+rwZ7GT5p0H1hBCTjueFwhvBTs5NO/J6WAc/d2eNk2uj1r3X/pmXhPK3Kv832KWe\neksI0fTNA7YNFfZd8hcx5ya8Pax7dS9XncG70eO91+wr+C0BRQx2RalcxGBXxP5te6CwPWZn\nE3aO9T0HO1mWs6/++kqv9rX9KrlVrtb2+fEH8z1BUiBJlvnz5rh/DR85LvPkxlXbzgzafn5F\nB//8i1zUKr/QH0598ZSjegMAIUTaufnuNV6Lu5bR2l1359G47/HwBO5rO9ctO21y7zd1/S2p\nTgjRs3dvj+aFPoAGAKVOzs0xm5YPmOPVcDqpDkXEGTsAAMqjzISVBr/Bav2DSw4efamex51X\nAAh2AACUU3LusQN/OgUE1+R0HYqMYAcAAKAQvCMfAABAIQh2AAAACkGwAwAAUAiCHQAAgEIQ\n7AAAABSCYAcAAKAQBDsAAACF+H+E5vaCj4s9dwAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\ndgAAAArxf9JZZv14Jq9HAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "install.packages('gridextra')\n",
    "library(gridExtra)\n",
    "#Fist we calculate the average distance, distance for both the casual and member type users:\n",
    "\n",
    "userType_means <- tripdata_cleaned %>% group_by(member_casual) %>% summarise(mean_time = mean(cycling_time),mean_distance = mean(distance_covered))\n",
    "\n",
    "membervstime <- ggplot(userType_means) + \n",
    "                geom_col(mapping=aes(x=member_casual,y=mean_time,fill=member_casual), show.legend = FALSE)+\n",
    "                labs(title = \"Mean travel time by User type\",x=\"User Type\",y=\"Mean time in sec\")\n",
    "\n",
    "membervsdistance <- ggplot(userType_means) + \n",
    "                    geom_col(mapping=aes(x=member_casual,y=mean_distance,fill=member_casual), show.legend = FALSE)+\n",
    "                    labs(title = \"Mean travel distance by User type\",x=\"User Type\",y=\"Mean distance In Km\",caption = \"Data by Motivate International Inc\")\n",
    "\n",
    "grid.arrange(membervstime, membervsdistance, ncol = 2)  \n",
    "\n",
    "#The we check  the number of rides diferences by weekday:\n",
    "tripdata_cleaned %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(cycling_time),.groups = 'drop') %>% \n",
    "  arrange(member_casual, weekday)  %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") +\n",
    "  labs(title = \"Number of rides by User type during the week\",x=\"Days of the week\",y=\"Number of rides\",caption = \"Data by Motivate International Inc\", fill=\"User type\") +\n",
    "  theme(legend.position=\"top\") "
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 302.333833,
   "end_time": "2023-04-25T19:18:52.528101",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-04-25T19:13:50.194268",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
