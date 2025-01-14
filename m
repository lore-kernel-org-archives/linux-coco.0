Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77ED1ADC91
	for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849349; cv=none; b=uLWgrTUi4fxA+R4dJHiSjilg8RJOf5AuPhdXOGhcpc9MHSF3dt+2+2YRLYDJWDvDRINHSLPWFr82jh7TZivPrjvOMM3i71HD5+dw20GD3ameMV8mMBAUheESpLhXHzpo9+v01SWNqb9wCYCCm+4dYjPtViudJqcfPrUpKn4/kUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849349; c=relaxed/simple;
	bh=e9daeFfoXZEKnrrUiCoSkT6nNkde62u1RAxjysDSA8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLrLP6gddrzW0/mT+cRbszfhCA9GgTtFmzdJFNwFB5Pn0FZ7BIyMZtbwtL/JPsCNaLHzNZ1uw+jxVDdAueg/YlADPSEaDgOleSIm/G4SqGl2I9rr/nksfvKV4BG0yl/E5vhqxuFFfKod5lqdDznwPW1/hqAwoXNd56yimgRZ5Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=buxXj+jT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XggG6EqW; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="buxXj+jT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XggG6EqW"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F41B51140218;
	Tue, 14 Jan 2025 05:09:06 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 14 Jan 2025 05:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1736849346; x=
	1736935746; bh=AcfRbVydz6NoUdsP2M9P1lF/DfwA+J2na2lpJTqLxqE=; b=b
	uxXj+jTB2QT4kLtB/g7i+Ukqa7CMdJxjhpZxnMXdgxXhOJ2wfpUVVPODBAHoRxy0
	UaSvhwfFWwvYJxehyVJqp2Uysh/BIe593BVTyytX0KsRLeAnwzbmXMVoOx3zXKM9
	XwbTGstIpDVdi9SHKa1XVu7x8BviEqHmfj+pyAq/xTHyzl8uz3mvDClWMtJ4AeZs
	7vyMnyvhCFrVWAMv+EaDIrQ+FEvCSisw5X+9NEmGFOc5RD8V9Jg6bXqOqPRS8Aqm
	R0H86VfR64PVJvUHsLWKTVw/+WxnZgLR/TIHQ7D1HZTXkeuLWi6xtOMjrkiqM7zz
	upt4qO/sKL0p/ZUKp1oCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736849346; x=1736935746; bh=AcfRbVydz6NoUdsP2M9P1lF/DfwA+J2na2l
	pJTqLxqE=; b=XggG6EqWtnbbEr05qOPn9Dgxs+re6S88aWaindTDayA1sYQz7wX
	HUR5cMBsxBqDUbUwn0vP+oQDSmkDEfxeDGjPRPpgOCTays7IrFQj715NBeG+aPBi
	gPqZuYiUj1O8Iay0iTvzmlezKQy1jgrvQvLDoWpRTpmR8bP1f41jd68yMH1K/y5v
	dYFoHdqUmme5TGvW+13v/aXNakApXIlq+wwNEenklVsU9je4sdBSRDteJzRqzOlr
	qdSKERv49OwdzyL6ecbWTWxCVirrC0G94gLKSKm8oMgdyG0AW24BJmnSbLuxbqnq
	P2qHibdEcnMvOv13T29RmiJ8OgCmvz4ik3Q==
X-ME-Sender: <xms:wjeGZwUlo2txiJzhs49CRqSm0qtu2B19MwxO3_xSJstXLnP03Jh9yw>
    <xme:wjeGZ0ldSyai7vGcw460bVzSR8uhDinVU2TpaKGUULNbx9V14oOrefhSHdlLBb3c4
    _OHQUuCHV6-iW9hTxA>
X-ME-Received: <xmr:wjeGZ0amkkhtZAjpWyMH-mjenJfkLIUiNQ0V2zYGOSeE4bTo0bWYcl6Js7WfzH0a6U5PYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfhhfff
    veelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhv
    rdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegvsghivgguvghrmhesgihmihhsshhiohhnrdgtohhmpdhrtghpthhtohepsghh
    vgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopehkvgigvggtsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohephigrnhdrhidriihhrghosehinhhtvghlrdgtoh
    hmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqtghotghosehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghk
    rdhprdgvughgvggtohhmsggvsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:wjeGZ_UbP-nGuAKzNrpxR2buC9CRoHhbpdt2wxtMTq3bQRKLVAiAsQ>
    <xmx:wjeGZ6nJHHtIJBW-TryCiW8UEyea4rQgO-H4I_DfVkfEyajF68W9cg>
    <xmx:wjeGZ0dPIj_i4THFj-G_t5XA92Oj3UMcehKzpTJ5aDdvDrwfq8TZpA>
    <xmx:wjeGZ8Ec586g1E3cNEOYwwEhUTlaKqKMC3zTed9DJtCukHKf-gILOg>
    <xmx:wjeGZ8fBFheae0Qocn1WLa0DwUKQ1UKNPBlb7xm2k5Y8hgyAFqbKTKPw>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 05:09:02 -0500 (EST)
Date: Tue, 14 Jan 2025 12:08:59 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org, 
	kexec@lists.infradead.org, Yan Zhao <yan.y.zhao@intel.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, security@kernel.org
Subject: Re: [PATCH v2 0/1] Accept unaccepted kexec segments' destination
 addresses
Message-ID: <ysjwziu3nzznorzwlkqz2dgfqgghzk7wiciaeszf4gar7e3jcz@3b5lzz6bbf5c>
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

On Mon, Jan 13, 2025 at 08:59:29AM -0600, Eric W. Biederman wrote:
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

The interface of accepting memory is platform specific. EFI (not ACPI)
only provides a way to enumerate which memory is unaccepted.

> I really don't think we should be making complicated work-arounds for
> someone else's bad software decision just because someone immortalized
> their bad decision in a standard.  Just accepting all of memory and
> letting the folks who made the bad decision deal with the consequences
> seems much more reasonable to me.

Note that these work-arounds are needed only because kexec allocates
memory in a hackish way bypassing page allocator.

I don't like that unaccepted memory details leaks into kexec code either.
But it happens because kexec is special and requires special handling.

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

It is outside of TDX (and I believe SEV) threat model. In TDX case, VMM
can block access to arbitrary guest memory range which would cause TD-exit
if guest touches it. The blocking is required to do some of memory
maintenance operations, like promoting 4k pages to 2M or relocating a
guest page to a different host physical address.

Lazy memory accept doesn't change anything from security PoV here.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
