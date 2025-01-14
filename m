Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65BB230D07
	for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 03:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736825181; cv=none; b=hmakAM5DXrv1U0pRdeYSG2O99Pyv6t5IR3t5qTUA8KWaBHDbLxKpMS6pL4y9fXcqK48248SFI4c8PIkJsDEeF9arnl/tJEyL8zEKf4L1KYaQctWHSYv1KPYhtgjVl9K2AV1WQgVNE6sn2bmsS4+skbeeq9EYLOdMJYrVFOiJIvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736825181; c=relaxed/simple;
	bh=n7QMu1Wwhkguk9gNDckMWivCYM0cpCB3vxs7wGNu5o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Mc5B+qePPpDEQSuIbE1xghrCBk+LaX1Eu+JguJbgU2L91NN6dY1QRDE5hlV60vhlJuUHKhUNeo/3bcGsfgr/Rboc46/exneNtl9XFyovWMEmi8zSa6RvuKTYaKRYDAaYeXUYiZOr+nuYOXQ8wjnQlZd7bG42XltDTv/R+cSfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKdlCmOe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKdlCmOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736825178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d7OzC1HKFU8JmEwRobBhBX2vuHvLWfrqgAKGuhYJWcM=;
	b=SKdlCmOekccOK4x0vIWbGAiuil6oVgSkrNbf9A0TkhvBqNdtydPcHPVECia3r1OTigQ/vm
	JeVNZYY5CQvSigYlymF6Z05Ruy9CWK+t0dwx9y1YzcoEC5r2tIzlYVUVe8FIV9z2mpK5Wy
	ojgmevs+xPYJTQeN00uvbpHTLt5RNvo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-qAnU3jGiMZ2MKgzrAbrq8A-1; Mon,
 13 Jan 2025 22:26:14 -0500
X-MC-Unique: qAnU3jGiMZ2MKgzrAbrq8A-1
X-Mimecast-MFC-AGG-ID: qAnU3jGiMZ2MKgzrAbrq8A
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 506AE1955DB9;
	Tue, 14 Jan 2025 03:26:12 +0000 (UTC)
Received: from localhost (unknown [10.72.112.156])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E70C195608A;
	Tue, 14 Jan 2025 03:26:09 +0000 (UTC)
Date: Tue, 14 Jan 2025 11:26:05 +0800
From: Baoquan He <bhe@redhat.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, akpm@linux-foundation.org,
	kexec@lists.infradead.org, Yan Zhao <yan.y.zhao@intel.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	x86@kernel.org, rick.p.edgecombe@intel.com,
	kirill.shutemov@linux.intel.com, security@kernel.org
Subject: Re: [PATCH v2 0/1] Accept unaccepted kexec segments' destination
 addresses
Message-ID: <Z4XZTdmDMJ3qwIY6@MiWiFi-R3L-srv>
References: <20241213094930.748-1-yan.y.zhao@intel.com>
 <xgycziy2o56hnom3oau7sbqed3meoni3razc6njj7ujatldnmm@s7odbl4splbn>
 <Z4T1G4dwzo7qdwSP@MiWiFi-R3L-srv>
 <87zfjuoj3i.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfjuoj3i.fsf@email.froward.int.ebiederm.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi Eric,

On 01/13/25 at 08:59am, Eric W. Biederman wrote:
> Baoquan He <bhe@redhat.com> writes:
> 
> > On 01/13/25 at 12:01pm, Kirill A. Shutemov wrote:
> >> On Fri, Dec 13, 2024 at 05:49:30PM +0800, Yan Zhao wrote:
> >> > Hi Eric,
> >> > 
> >> > This is a repost of the patch "kexec_core: Accept unaccepted kexec
> >> > destination addresses" [1], rebased to v6.13-rc2.
> >> 
> >> Can we get this patch applied?
> >
> > This looks good to me. In v1, we have analyzed all other possible
> > solutions, however change in this patch seems the simplest and most
> > accepatable one.
> 
> Truly?  I will go back and look and see what I missed but I haven't seen
> anything that I addressed my original objections.
> 
> To repeat my objection.  The problem I saw was that the performance of
> the accepted memory paradigm was so terrible that they had to resort to
> lazily ``accepting'' memory, which leads to hacks in kexec.  I would not
> like to included hacks in kexec just so that other people can avoid
> fixing their bugs.
> 
> I did see a coherent explanation of the bad performance that pointed the
> finger squarely at the fact that everything is happening a page at a
> time.  AKA that the design of the ACPI interface has a flaw that needs
> to be fixed.
> 
> I really don't think we should be making complicated work-arounds for
> someone else's bad software decision just because someone immortalized
> their bad decision in a standard.  Just accepting all of memory and
> letting the folks who made the bad decision deal with the consequences
> seems much more reasonable to me.

Ah, I didn't realized you object the accept_memory feature itself, sorry
about that. I personally dislike accept_memory either since there's
already DEFERRED_STRUCT_PAGE_INIT feature to improve the boot time
memory init. While talking about the passive providing RAM to guest
system when actually demanded, this seems to be helpful to save RAM
memory for cloud provider's host system, this is what I think is
valuable of the accept_memory, even though Intel engineer avoids to
delcare it formally.

Anyway, I would like to ack it based on accept_memory feature having
already been merged into mainline kernel. If the feature itself is
objected, the top priority is discussing to decide if we should take it
off in kernel or how limitedly it's being used in kernel, or vice versa,
whether supporting it in kexec truly is another story.

Thanks a lot for your thought sharing with elaborate explanation.

Thanks
Baoquan

> 
> > If Eric has no objection, maybe Andrew can help pick this into his
> > tree.
> 
> I have a new objection.  I believe ``unaccepted memory'' and especially
> lazily initialized ``unaccepted memory'' is an information leak that
> could defeat the purpose of encrypted memory.  For that reason I have
> Cc'd the security list.  I don't know who to CC to get expertise on this
> issue, and the security list folks should.
> 
> Unless I am misunderstanding things the big idea with encrypted
> memory is that the hypervisor won't be able to figure out what you
> are doing, because it can't read your memory.
> 
> My concern is that by making the ``acceptance'' of memory lazy, that
> there is a fairly strong indication of the function of different parts
> of memory.  I expect that signal is strong enough to defeat whatever
> elements of memory address randomization that we implement in the
> kernel.
> 
> So not only does it appear to me that implementation of ``accepting''
> memory has a stupidly slow implementation, somewhat enshrined by a bad
> page at a time ACPI standard, but it appears to me that lazily
> ``accepting'' that memory probably defeats the purpose of having
> encrypted memory.
> 
> I think the actual solution is to remove all code except for the
> "accept_memory=eager" code paths.  AKA delete the "accept_memory=lazy"
> code.  At that point there are no more changes that need to be made to
> kexec.
> 
> Eric
> 

