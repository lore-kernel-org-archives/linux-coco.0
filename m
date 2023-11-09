Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCFB374E0
	for <linux-coco@lists.linux.dev>; Thu,  9 Nov 2023 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="aDEy3/GK";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="aDEy3/GK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1699555139;
	bh=W5Q+VrL+oMRcosTrKGOaCl9dbCzmJhDrQVVH+kKrCCA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=aDEy3/GKCU8/PKzRKbwdvc1nJwgYCHi5a+1jCgiOUQ0V4Q7C0Jo2kEtqhn0aX0hP1
	 JEreUOBdAqvaFewhNgZAs1Zr8ORUJQZ0WKRkJUP0GyDsuU2QYDkLt862W62s8WCOir
	 tl2+3l624tLOQvnXcMmCn6B85i/tOk2CzjFVb2Kg=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id CA6A41287AF1;
	Thu,  9 Nov 2023 13:38:59 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id J51yJjF08RK9; Thu,  9 Nov 2023 13:38:59 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1699555139;
	bh=W5Q+VrL+oMRcosTrKGOaCl9dbCzmJhDrQVVH+kKrCCA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=aDEy3/GKCU8/PKzRKbwdvc1nJwgYCHi5a+1jCgiOUQ0V4Q7C0Jo2kEtqhn0aX0hP1
	 JEreUOBdAqvaFewhNgZAs1Zr8ORUJQZ0WKRkJUP0GyDsuU2QYDkLt862W62s8WCOir
	 tl2+3l624tLOQvnXcMmCn6B85i/tOk2CzjFVb2Kg=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 46F221287AE6;
	Thu,  9 Nov 2023 13:38:59 -0500 (EST)
Message-ID: <a6155b6a3a211fa690ef9caa9c2e219dbcfec340.camel@HansenPartnership.com>
Subject: Re: RFC: CCC Linux Kernel SIG
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dan Middleton <dan.middleton@linux.intel.com>, linux-coco@lists.linux.dev
Date: Thu, 09 Nov 2023 13:38:57 -0500
In-Reply-To: <4dcca77e-e6d0-4cd1-9813-6a7ad24ba0e8@linux.intel.com>
References: <4dcca77e-e6d0-4cd1-9813-6a7ad24ba0e8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2023-11-07 at 19:24 -0600, Dan Middleton wrote:
> One of the technical limitations to the adoption rate for
> Confidential Computing is the speed at which we as a community can
> add features to the Linux kernel. Each vendor has similar needs of
> the kernel but has historically presented significantly different
> ABIs. To  contain complexity and manage maintainability, the Linux
> kernel community tries to prevent proliferation of unnecessarily
> vendor specific ABIs. Often the opportunity for commonality is
> unclear until multiple vendors have proposed separate interfaces [0].

The kernel community would see this as a feature not a bug.  It's very
difficult to appreciate the technical ramifications until you see the
actual code so even though it seems like more work in the beginning it
produces better and faster outcomes in the end.

To give the counter point to your example: each CC implementation had
its own ioctl set.  The proposal unifies it through a configfs
interface, but it's still not clear that the unification covers all the
use cases.  This, though, can be worked through after the acceptance of
the configfs pull request.  Adding ioctls is fairly simple, so there
wasn't really much wasted work before agreement was reached on a
preliminary design for configfs which can now be worked on by everyone.

[...]
> The Linux kernel community has not been a regular part of 
> discussions and the CCC has not been a regular participant on the
> Linux Kernel Mail List (LKML)[1].

Isn't this the current key problem with an obvious solution: the
interested members of the CCC can simply join the lists.  You could
make them do a formalised readout back to the CCC for people who don't
want to be at the kernel list sharp end and establish an action plan
from there if things are perceived to be going wrong.

> The pipeline of activity is expected (but not required) to look like
> this:
> 1. Identify feature need on mailing list or informal forum.
> 2. Exchange community proposals in the SIG.
> 3. Achieve informal consensus in the SIG.
> 
>      a. Author patches and take them to the appropriate community,
> e.g., LKML.

This really isn't the correct workflow for the Kernel.  The kernel
likes to see sketches in code when arguing about ABI and design.

The process really already works like your 1,2,3 with the exception
that 1. begins on the kernel or KVM list.  Trying to achieve consensus
in some other industrial forum and then present the patches to the list
as the unified consensus hasn't really worked out well in the past
(NVMe still has the scars to prove this).

[...]
> In addition to video meetings, the community will use an existing 
> Discord channel for ongoing communication

Just on a personal note: I've had no end of trouble with Discord,
primarily around the verification requirements for my email address
preventing me from getting an account from the single gatekeeper, so it
would be last on my list of useful systems for open conversations.

James

