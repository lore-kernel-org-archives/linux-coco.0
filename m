Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA5811185
	for <linux-coco@lists.linux.dev>; Tue, 26 Nov 2024 11:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621100; cv=none; b=a+9J1TPb8wcIXfZSPXk6by91wm4p7TPsM5RBsFgCntPb+nYYw3INIZCExMqsMpUfBalAPuh5I4UUIqElbCkyw0o90uM2p2uB9amXxJCn6iJuQuEXeyZNYidqT+4wMC57IY4d5MBToTmaYgSlMDScfF+4OjKKr3njrEus4A8q4Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621100; c=relaxed/simple;
	bh=xQSoE2fGzVRGaRojfci1MKJePtHomuV4kjdRhwy73EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diV6AHkMSd6GuHdAmzgwHj9vmgyd80CG1RZJn7mADp5BB7CwEF74vMgD3vxpsD7ZtJpO+g7In6fQaAe7nxw3vSEb9rD7TdSDSWWXovSkrGJn/SUh+tP1PYfkSQ0ZVfO9VM1QgpEqFD9g+wkLeUf9YY8q08lwLsVlakJFeHw53tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+xPDwaz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+xPDwaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732621097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8SlxkVrFF9+w/Hc6R6JHl5eJHzWUPo6rcRHWt3F4SyQ=;
	b=X+xPDwazKSNoxdxX3WFmSsMizly6wMpR/bEUbhEGOJvR7A2b4GW063aqO7S0DQNoqYJ1XF
	MpLD21w298p/XYA3kZQxuc+vGy7izKlVn+lg+h/tqkx41WWsC3h1hBY86QatgA89SttKmy
	NZ0uAPOW7A9KdiyvF0WvBaRDxGObp/E=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-ZzkRq5zLMQ2LY9jFI9rV5Q-1; Tue,
 26 Nov 2024 06:38:14 -0500
X-MC-Unique: ZzkRq5zLMQ2LY9jFI9rV5Q-1
X-Mimecast-MFC-AGG-ID: ZzkRq5zLMQ2LY9jFI9rV5Q
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F3D5219541A0;
	Tue, 26 Nov 2024 11:38:11 +0000 (UTC)
Received: from localhost (unknown [10.72.113.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 19EF0195DF81;
	Tue, 26 Nov 2024 11:38:09 +0000 (UTC)
Date: Tue, 26 Nov 2024 19:38:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, x86@kernel.org,
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com
Subject: Re: [PATCH] kexec_core: Accept unaccepted kexec destination addresses
Message-ID: <Z0WzHZ+fNn6WuH/E@MiWiFi-R3L-srv>
References: <20241021034553.18824-1-yan.y.zhao@intel.com>
 <87frop8r0y.fsf@email.froward.int.ebiederm.org>
 <tpbcun3d4wrnbtsvx3b3hjpdl47f2zuxvx6zqsjoelazdt3eyv@kgqnedtcejta>
 <87cyjq7rjo.fsf@email.froward.int.ebiederm.org>
 <ZxmRkUNmx863Po2U@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxmRkUNmx863Po2U@yzhao56-desk.sh.intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 10/24/24 at 08:15am, Yan Zhao wrote:
> On Wed, Oct 23, 2024 at 10:44:11AM -0500, Eric W. Biederman wrote:
> > "Kirill A. Shutemov" <kirill@shutemov.name> writes:
> > 
> > > Waiting minutes to get VM booted to shell is not feasible for most
> > > deployments. Lazy is sane default to me.
> > 
> > Huh?
> > 
> > Unless my guesses about what is happening are wrong lazy is hiding
> > a serious implementation deficiency.  From all hardware I have seen
> > taking minutes is absolutely ridiculous.
> > 
> > Does writing to all of memory at full speed take minutes?  How can such
> > a system be functional?
> > 
> > If you don't actually have to write to the pages and it is just some
> > accounting function it is even more ridiculous.
> > 
> > 
> > I had previously thought that accept_memory was the firmware call.
> > Now that I see that it is just a wrapper for some hardware specific
> > calls I am even more perplexed.
> > 
> > 
> > Quite honestly what this looks like to me is that someone failed to
> > enable write-combining or write-back caching when writing to memory
> > when initializing the protected memory.  With the result that everything
> > is moving dog slow, and people are introducing complexity left and write
> > to avoid that bad implementation.
> > 
> > 
> > Can someone please explain to me why this accept_memory stuff has to be
> > slow, why it has to take minutes to do it's job.
> This kexec patch is a fix to a guest(TD)'s kexce failure.
> 
> For a linux guest, the accept_memory() happens before the guest accesses a page.
> It will (if the guest is a TD)
> (1) trigger the host to allocate the physical page on host to map the accessed
>     guest page, which might be slow with wait and sleep involved, depending on
>     the memory pressure on host.
> (2) initializing the protected page.
> 
> Actually most of guest memory are not accessed by guest during the guest life
> cycle. accept_memory() may cause the host to commit a never-to-be-used page,
> with the host physical page not even being able to get swapped out.

So this sounds to me more like a business requirement on cloud platform,
e.g if one customer books a guest instance with 60G memory, while the
customer actually always only cost 20G memory at most. Then the 40G memory
can be saved to reduce pressure for host. I could be shallow, just a wild
guess.

If my guess is right, at least those cloud service providers must like this
accept_memory feature very much.

> 
> That's why we need a lazy accept, which does not accept_memory() until after a
> page is allocated by the kernel (in alloc_page(s)).

By the way, I have two questions, maybe very shallow.

1) why can't we only find those already accepted memory to put kexec
kernel/initrd/bootparam/purgatory?

2) why can't we accept memory for (kernel, boot params/cmdline/initrd)
in 2nd kernel? Surely this purgatory still need be accepted in 1st kernel.
Sorry, I just read accept_memory() code, haven't gone through x86 boot
code flow.

Thanks
Baoquan

