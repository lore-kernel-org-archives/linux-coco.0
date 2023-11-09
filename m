Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72F38F94
	for <linux-coco@lists.linux.dev>; Thu,  9 Nov 2023 22:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljxEsh+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699568861; x=1731104861;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=pVZ7lRm3XFIeymCfKGDu4zIqbrie8tGBSzv9IgUfa80=;
  b=ljxEsh+Jug/cftUPMx6wIvF3wSkKJHYdo9MICwkEEwVPkYtCtBXXH8qe
   wqYRjOyPP3nd3QUm5BwtlsQWsyxKqNtG3JY87cmj/NaCPqEQ9+sQCBvhg
   /Ha+nIX6PrWcLH7TzN0FUAdNloBxPVotbs8Peesr+86PFls9RhaEm7TrL
   Xl2U+X6kV8aMjMH9+wYu8AZQZfoUXlxGFFlKjuaWJu797uNsiWdvogWfh
   anh6NblkQv2YhKg/7KbK126M2mOR0HVEGOoDR1s0aMj3iC+y++EhZIIhU
   rcVgSeyCsk1cqD5n/uUzhUcPns3BtXhuOQLDwbFJrPSMTp5QMADU9kSZH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380477326"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="380477326"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1095013312"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="1095013312"
Received: from pjperrel-mobl.amr.corp.intel.com (HELO [10.92.32.81]) ([10.92.32.81])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:27:35 -0800
Message-ID: <c190ef76-77e1-4493-8481-a46d75eff1c8@linux.intel.com>
Date: Thu, 9 Nov 2023 16:27:34 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: CCC Linux Kernel SIG
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 linux-coco@lists.linux.dev
References: <4dcca77e-e6d0-4cd1-9813-6a7ad24ba0e8@linux.intel.com>
 <a6155b6a3a211fa690ef9caa9c2e219dbcfec340.camel@HansenPartnership.com>
From: Dan Middleton <dan.middleton@linux.intel.com>
In-Reply-To: <a6155b6a3a211fa690ef9caa9c2e219dbcfec340.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/23 12:38 PM, James Bottomley wrote:
> On Tue, 2023-11-07 at 19:24 -0600, Dan Middleton wrote:
>> One of the technical limitations to the adoption rate for
>> Confidential Computing is the speed at which we as a community can
>> add features to the Linux kernel. Each vendor has similar needs of
>> the kernel but has historically presented significantly different
>> ABIs. To  contain complexity and manage maintainability, the Linux
>> kernel community tries to prevent proliferation of unnecessarily
>> vendor specific ABIs. Often the opportunity for commonality is
>> unclear until multiple vendors have proposed separate interfaces [0].
> The kernel community would see this as a feature not a bug.  It's very
> difficult to appreciate the technical ramifications until you see the
> actual code so even though it seems like more work in the beginning it
> produces better and faster outcomes in the end.
>
> To give the counter point to your example: each CC implementation had
> its own ioctl set.  The proposal unifies it through a configfs
> interface, but it's still not clear that the unification covers all the
> use cases.  This, though, can be worked through after the acceptance of
> the configfs pull request.  Adding ioctls is fairly simple, so there
> wasn't really much wasted work before agreement was reached on a
> preliminary design for configfs which can now be worked on by everyone.
>
> [...]

I agree we got there, but the path was quite long.
This might be the point where the second vendor ioctl was proposed which
would eventually give rise to the observation that a profusion of ioctl's
is bad:
https://lore.kernel.org/all/cover.1624719668.git.sathyanarayanan.kuppuswamy@linux.intel.com/

That was June 2021. It's now November 2023.

>> The Linux kernel community has not been a regular part of
>> discussions and the CCC has not been a regular participant on the
>> Linux Kernel Mail List (LKML)[1].
> Isn't this the current key problem with an obvious solution: the
> interested members of the CCC can simply join the lists.  You could
> make them do a formalised readout back to the CCC for people who don't
> want to be at the kernel list sharp end and establish an action plan
> from there if things are perceived to be going wrong.

I think that's a great suggestion.
That probably catches things already on the list.

What about getting in front of things before that stage?

>> The pipeline of activity is expected (but not required) to look like
>> this:
>> 1. Identify feature need on mailing list or informal forum.
>> 2. Exchange community proposals in the SIG.
>> 3. Achieve informal consensus in the SIG.
>>
>>       a. Author patches and take them to the appropriate community,
>> e.g., LKML.
> This really isn't the correct workflow for the Kernel.  The kernel
> likes to see sketches in code when arguing about ABI and design.
>
> The process really already works like your 1,2,3 with the exception
> that 1. begins on the kernel or KVM list.  Trying to achieve consensus
> in some other industrial forum and then present the patches to the list
> as the unified consensus hasn't really worked out well in the past
> (NVMe still has the scars to prove this).
>
> [...]
That's really interesting. I'd love any references about what didn't work
and what did work.

I think we could revise step 1 to read like.. learn about upcoming
features in the SIG and then recognize whether those will have kernel
impacts.

For example, it looks like most CPU vendors will be offering different
analogs of runtime measurement registers.

TEE-IO is coming down the pipe from CPU and device vendors.

There are software vendors working on novel use cases which might
imply different access patterns.

Would the CCC facilitating a mechanism to generate these cross-vendor
conversations be helpful?

What else would be helpful?

Thanks,
Dan Middleton


