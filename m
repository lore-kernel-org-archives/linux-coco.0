Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E252313E21
	for <linux-coco@lists.linux.dev>; Fri, 30 Jan 2026 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769811189; cv=none; b=sMrQZexTlEHHOh5MOvpezvLAG6AhlSaQOoUEWz7a/rW1FeSBsMahOLCCjWM/wOlQGQZeN850r9RJuAD2uTp7EQitC9MOw+fPEbBqM1AcA/qklAwrwcjzFleWyIYgZXFE9H++eRlj6EitcePZwfuXk9i5bbEWgRefu3UKIZ+PN8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769811189; c=relaxed/simple;
	bh=fqB7+8dS12eWkGWVQCkOMxIuzwlywvukfO+eKrTAFAU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mo19ujRclKW/7QWq/3FBtlj1Wc3/cHBxZCyrhVN/M9rXKfSGe13s8ZDPiNiOKFftIIAk7oJKzWWuHSZElsapu1VHVZahdtNA7hZh3v/YZSucoXh+gOYCj33xLnODl7z5jNdZnq9S7OXfNUt+QR/qdkpE5BqqVIodCBUDLQItrU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X11ArPy+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X11ArPy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBCEC4CEF7;
	Fri, 30 Jan 2026 22:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769811188;
	bh=fqB7+8dS12eWkGWVQCkOMxIuzwlywvukfO+eKrTAFAU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=X11ArPy+p5cibT4AZUn7ryAgqvqP1jd92rDqgexHNXElV+2N+gf9S8S3BJh337esA
	 v+PGETTP7yqI9XHGPs7WaUR79RKAIys9H25w7LbV66TARXLaiDXWQYHMzxR32NFjpJ
	 03PThUc9cBB/NSF5sDU4N/iLez5LzCZQi89liFmJ6NGuJxZ2C7KKQe5tOkV6dcMbfK
	 L79LRKd8B9lzhSN6Y4wMNM0VOz+U3AJH9s2AVNqyv+uSDuvfuSPjcIgok0ENafDl+I
	 J6ehTtmplsqOkM6A4pjD+f2L0wEiieIKDgOlIxY7OpSnH/KCG7ZpaZUcPiwZ0NyYmY
	 Dn9rVSijlSq4g==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8330FF40068;
	Fri, 30 Jan 2026 17:13:07 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 30 Jan 2026 17:13:07 -0500
X-ME-Sender: <xms:8yx9aZL1rqIERfxTffc6E9DpoQ96nrAUeUDgK5k7ucOmnGOumCXpFg>
    <xme:8yx9af-ORk_Jps_OIIY_3ZkqAlEClLopkJoXE3TeZ6rNi3eoWH5a7zeUPc1hJanb6
    Kp9cdTEjMVD6ixKpnC3-YUE7SCPH3mQGjaBGPYJCzcVDzs4--gcJko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedtvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeeuteeiudeigeekjedvheduieehteetgfdtuefghfejgffhfedtleehvdeh
    fffhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehthhhomhgrshdrlhgvnhgurggtkhihsegrmhgurdgtohhmpdhrtghpthhtoheprg
    hnughrihhsrggrrhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepghhrohgslhgvrhes
    ghhoohhglhgvrdgtohhmpdhrtghpthhtohepthiinhesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqtghotghosehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghp
    thhtoheptghhrhhishgsohhlthiisehmvghtrgdrtghomhdprhgtphhtthhopehhvhholh
    hkmhgvrhesmhgvthgrrdgtohhmpdhrtghpthhtohepkhgvvhhinhhhuhhisehmvghtrgdr
    tghomhdprhgtphhtthhopeihohhunhhgjhgrvghlvggvsehmvghtrgdrtghomh
X-ME-Proxy: <xmx:8yx9aaHg5IUpF6yvOIZ7bKZ9Jugsb28yGOkSRxwZ6TKPKk66sERFKQ>
    <xmx:8yx9aQQAPWQ32aWU9sQXqQ52smYJnPl8h-Ev-hif3QoSAlf2HrQklw>
    <xmx:8yx9aYbJLHmlIN-gXEP9shGqBQmKkYKSugTHWpCyvuFuFiQU6jN3sw>
    <xmx:8yx9aT3oSeImGQgny5mgMinqHvyabLCO9vX6Hgk3kpcXvZvHWUeegw>
    <xmx:8yx9aTqsYYf8bVXBUJDEXHolP_DJLbYbYU6PLiu5ZbF0mDP47otBsAf0>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6435E700065; Fri, 30 Jan 2026 17:13:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ACwufv8cnFW3
Date: Fri, 30 Jan 2026 23:12:47 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Tom Lendacky" <thomas.lendacky@amd.com>, "Kevin Hui" <kevinhui@meta.com>,
 linux-coco@lists.linux.dev
Cc: youngjaelee@meta.com, hvolkmer@meta.com, chrisboltz@meta.com,
 tzn@google.com, andrisaar@google.com, grobler@google.com
Message-Id: <c76f6a88-8b24-46d1-b7da-59b6f48c5062@app.fastmail.com>
In-Reply-To: <3dd58daf-6b7c-4887-b510-9c4fb7de0469@amd.com>
References: <8d47d224-0ce0-417f-8c12-3ab9d6da8a59@meta.com>
 <6bb2c25f-e51b-4d90-a67e-100bff1af838@amd.com>
 <e634d3f1-a58b-4303-9066-0dabc96d825f@app.fastmail.com>
 <3dd58daf-6b7c-4887-b510-9c4fb7de0469@amd.com>
Subject: Re: 6.18 CVM guest kernel boot issues with non-UEFI bootloader
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Jan 2026, at 23:05, Tom Lendacky wrote:
> On 1/30/26 14:49, Ard Biesheuvel wrote:
>> Hi Tom Kevin,
>>=20
>> On Fri, 30 Jan 2026, at 19:49, Tom Lendacky wrote:
>>> Adding Ard
>>>
>>> On 1/28/26 21:57, Kevin Hui wrote:
...
>>>> Perhaps the proper fix for this is to put the variables that are se=
t as part of
>>>> sev_enable() into .data so that both non-UEFI and UEFI bootloaders =
will have the
>>>> same treatment from the kernel, but I would love to hear everyone=E2=
=80=99s thoughts on
>>>> this.
>>>>
>>=20
>> AIUI, the root cause of the issue is that C code is being called (sev=
_enable()) before BSS has been cleared, right?
>
> Right, but the issue also is that the BSS gets cleared after relocatio=
n,
> too. So I don't think using BSS is correct, because it would have to be
> cleared before the call to sev_enable(). But the call to clear the BSS
> after relocation would have to stay because to, otherwise the guest cr=
ashes.
>

Yeah, and relocating the image should migrate the contents of BSS too. S=
o I agree that this is tricky. I hate the decompressor ...

>>=20
>> If so, I don't think moving variables around is the right solution he=
re: instead, BSS should be cleared before calling C code. And by the loo=
ks of it, this is not even SEV-specific, given that load_stage1_idt() is=
 also a C function.
>
> Because of how things are called and because of the relocation, I think
> putting the variables in .data is probably the right thing to do. I've
> noticed a few other files under arch/x86/boot/compressed that have
> variables defined with __section(".data") probably for the same reason.
>
> The load_stage1_idt() function only works with variables on a stack or=
 in
> .data (boot_idt), which is probably why that works ok.
>

Indeed. In fact, creating any global state before relocation is rather t=
ricky because of how the image moves itself around. But I guess it is un=
avoidable here.

