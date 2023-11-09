Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DEF36AFE
	for <linux-coco@lists.linux.dev>; Thu,  9 Nov 2023 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/31QMjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699563956; x=1731099956;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Ks8lhYSHX3MGCd6NIjFZa/RYSDwaHr8NYcmrH6gzbRM=;
  b=A/31QMjWMN6JcwVmaA67xW6OTBuPckAoN+SEw6zUJtJRw4r7guydgShB
   n8dLim/WQPWcgWfbxnEkqsJG/gxApsqgQ9VAxiPHgtJ2dUc8VYWaVXwux
   1tCIERFj75HTZVs2rnln/pPUuwWo1CC3+hqoTrLZVzVNoBC7nMBO/5eMG
   2fluE+9dk6lZtvTPf4HBYrFQ7iPcdmv4dCPtjid1ts9rvaAdcu82hT+wM
   nApGRk3rAWyaFCRU5OI4oEiSR7J6kEoQWPXvAimwobENp2GoKBlQiaNWO
   tWG3nISIqIzKrAGc0lU7sFq27cOpYvNZlcW4pqze/cqxbrWHvubrs0cg2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454376433"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="454376433"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829444122"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="829444122"
Received: from pjperrel-mobl.amr.corp.intel.com (HELO [10.92.32.81]) ([10.92.32.81])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:05:54 -0800
Message-ID: <0743a815-e567-4273-8e13-bf8372c7ee71@linux.intel.com>
Date: Thu, 9 Nov 2023 15:05:53 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: CCC Linux Kernel SIG
Content-Language: en-US
To: Carlos Bilbao <carlos.bilbao@amd.com>, linux-coco@lists.linux.dev
References: <4dcca77e-e6d0-4cd1-9813-6a7ad24ba0e8@linux.intel.com>
 <22966e1b-dd7f-4eb2-ac5d-5988cc6687b6@amd.com>
From: Dan Middleton <dan.middleton@linux.intel.com>
In-Reply-To: <22966e1b-dd7f-4eb2-ac5d-5988cc6687b6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/23 11:22 AM, Carlos Bilbao wrote:

> On 11/7/23 19:24, Dan Middleton wrote:
>> <snip>
>> In addition to video meetings, the community will use an existing 
>> Discord channel for ongoing
>> communication. No mail list is required at this time.
>
> May I ask what Discord channel you're referring to? I'm assuming it's
> open access.
>
https://discord.com/channels/1123803528377413762/1124090655707234334

I believe it is open.
All CCC community forums zoom, slack, mail list, code are open.
However, this is a pre-existing channel... see below.

On 11/9/23 12:38 PM, James Bottomley wrote:
> Just on a personal note: I've had no end of trouble with Discord,
> primarily around the verification requirements for my email address
> preventing me from getting an account from the single gatekeeper, so it
> would be last on my list of useful systems for open conversations.

The CCC typically uses slack.

This discord reference is meant to accommodate kernel contributors who are
already communicating there. We don't want to break anything that's working.
Instead looking to bridge these different parts of the confidential 
computing
community who aren't in communication right now.

Thanks for the feedback and questions so far!


Regards,

Dan Middleton


