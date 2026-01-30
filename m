Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C126CE17
	for <linux-coco@lists.linux.dev>; Fri, 30 Jan 2026 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769806211; cv=none; b=oJNDRtWVSBSbK6dOEbl//svxuPSTn0E/+eLoloqkfpLj57YJyZc/Mtug/Md8Q0TguctFtoztsD4YzzNqWVUR0CPRqpzLdEFHpsqcPK/JRGtqxCP9Yx7sytrr+mNUOpDeVxGdnMJWadn8e2Ik2TwDBwxCTsNNsnPDNPfjPEgmRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769806211; c=relaxed/simple;
	bh=Uas/+y/uq0/UoJAEfmpAG6FxjmQqKUDESEgULXZ/Lx4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IGpb05hEiti7PNZHuwDqftBprMgSz5d4DcfhXaUAb+dMyn72K5/5u2yKF1sx2NspQ9igwuKMkF+VvGbBZUYC68VKsgtJnZWTE/supctewoIitur1vA3pbUxNIuT1tRJDgvqCxgKogQb30nAMvXKUvd9XRn+TAByDM+p8hmPbv+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIGQ9Sb9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIGQ9Sb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD31C16AAE;
	Fri, 30 Jan 2026 20:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769806210;
	bh=Uas/+y/uq0/UoJAEfmpAG6FxjmQqKUDESEgULXZ/Lx4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eIGQ9Sb97bdhLvBf4fA0GT6VWyeJlxjo79ntlSEmfa9NPjBpaX/rRNmN/IKhPWvO0
	 KjMkfAvYbmUsn3okMgJAjBFWiplC5NaGeBkR/ace9enfLf7ulE4lATh/j4BmiIkvLB
	 FWQ187HZyLBVmZrJmubkmnipeXmhVuYqVZ+s6K5HvCb3oPgGkfV2scqUyyLY2nnBlG
	 Y4KEURPdfNC0R0rJgqQRxhDGwjWLKihvifTQBbWRHH7o20+jYF0H7qkb24CN1oqO7Q
	 A7oElx/fokjjVAAst9s1Jbya53QIAH1idmfM7WByTwlMxHqYUBnlrkIuP6UU5HKbWW
	 vSvexpi2aBRfw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7075AF40073;
	Fri, 30 Jan 2026 15:50:09 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 30 Jan 2026 15:50:09 -0500
X-ME-Sender: <xms:gRl9afbgD-g-B3aeA1U0ai6xCn0rgSm4uwY0RmbDPh8huXDAdegyyw>
    <xme:gRl9aZOgNqWM-Thu4uk4dHvov15plQPrsVd0LggNo6EmU2vu1wGCQEalu0h9cROSI
    sBZCk2zIu8hY_PBSXEhUhawC7WWfUVkfy6he5MViCVTkYJu1mwdQ0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedttdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelffdufffhhfdtvdekffelkeehleelieehheeuteejtefgfeduhfffuedt
    hfekkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhmrghsrdhlvghnuggrtg
    hkhiesrghmugdrtghomhdprhgtphhtthhopegrnhgurhhishgrrghrsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehgrhhosghlvghrsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehtiihnsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlihhnuhigqdgtohgtohes
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegthhhrihhssgholhhtiiesmh
    gvthgrrdgtohhmpdhrtghpthhtohephhhvohhlkhhmvghrsehmvghtrgdrtghomhdprhgt
    phhtthhopehkvghvihhnhhhuihesmhgvthgrrdgtohhmpdhrtghpthhtohephihouhhngh
    hjrggvlhgvvgesmhgvthgrrdgtohhm
X-ME-Proxy: <xmx:gRl9aSWMVIW3IJKChiI8G5_CrIZy7lzMOrr6KupU21qMViygSHz8Aw>
    <xmx:gRl9aTifkRCJWt_d4kDz6j3gdFZFg9DDxVmGY_HEu3-ubtrIzjOOpA>
    <xmx:gRl9aapKLbzzeGuAw8UZsFPz_MuJnSdVTiK2Xz1bFXHDZSM1Y-lPdg>
    <xmx:gRl9aZE8tyL__Ktl4rEPQpy-CwjtYK0uqFeVw-CVYLoOKN0F2-m9CQ>
    <xmx:gRl9af4LIsVKz-taqHt5Gs8oHhJNr3iJZ--xpoKU_QFhFrJ07ouh-bho>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4C6FB700065; Fri, 30 Jan 2026 15:50:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ACwufv8cnFW3
Date: Fri, 30 Jan 2026 21:49:48 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Tom Lendacky" <thomas.lendacky@amd.com>, "Kevin Hui" <kevinhui@meta.com>,
 linux-coco@lists.linux.dev
Cc: youngjaelee@meta.com, hvolkmer@meta.com, chrisboltz@meta.com,
 tzn@google.com, andrisaar@google.com, grobler@google.com
Message-Id: <e634d3f1-a58b-4303-9066-0dabc96d825f@app.fastmail.com>
In-Reply-To: <6bb2c25f-e51b-4d90-a67e-100bff1af838@amd.com>
References: <8d47d224-0ce0-417f-8c12-3ab9d6da8a59@meta.com>
 <6bb2c25f-e51b-4d90-a67e-100bff1af838@amd.com>
Subject: Re: 6.18 CVM guest kernel boot issues with non-UEFI bootloader
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Tom Kevin,

On Fri, 30 Jan 2026, at 19:49, Tom Lendacky wrote:
> Adding Ard
>
> On 1/28/26 21:57, Kevin Hui wrote:
>> Hello,
>>=20
>> We=E2=80=99ve been using a non-UEFI bootloader to launch SEV-SNP CVMs=
 and noticed that
>> there=E2=80=99s an issue with booting the newest 6.18 guest kernel wi=
th
>> the stage0 bootloader (https://github.com/project-oak/oak/tree/main/s=
tage0_bin).
>> The guest kernel boots successfully with 6.17 and below, but fails wi=
th 6.18. We
>> were able to reproduce this with host kernels 6.13.2 and 6.18.3 on Mi=
lan/Genoa
>> hosts.
>>=20
>> We traced the commit that started causing boot issues to
>> 68a501d7fd82454525797971c6a0005ceeb93153 and noticed that for some re=
ason the
>> variable snp_vmpl was non-zero, even though our stack doesn=E2=80=99t=
 run SVSM. This
>> triggers the sev_es_terminate() call and subsequently crashes the CVM=
. We
>> noticed that the commit removes a supposedly redundant rmpadjust() ch=
eck, but
>> from our observations it seems that the failed rmpadjust() short-circ=
uited the
>> check and avoided the underlying issue.
>>=20
>> I was chatting with Tom about this, and taking a deeper look at the i=
ssue, we
>> suspect that the BSS is cleared after the sev_enable() call in
>> arch/x86/boot/compressed/head_64.S, and that because of this snp_vmpl=
 contains
>> random junk and is not zeroed. When coming through UEFI, it seems tha=
t the BSS
>> is cleared via drivers/firmware/efi/libstub/x86-stub.c, but in a non-=
UEFI
>> bootloader there is no call to startup_64 and so this path is never i=
nvoked,
>> leaving whatever random data was in bss to remain.
>>=20

If there is no call to startup_64(), where does the call to sev_enable()=
 originate from?

>> Perhaps the proper fix for this is to put the variables that are set =
as part of
>> sev_enable() into .data so that both non-UEFI and UEFI bootloaders wi=
ll have the
>> same treatment from the kernel, but I would love to hear everyone=E2=80=
=99s thoughts on
>> this.
>>=20

AIUI, the root cause of the issue is that C code is being called (sev_en=
able()) before BSS has been cleared, right?

If so, I don't think moving variables around is the right solution here:=
 instead, BSS should be cleared before calling C code. And by the looks =
of it, this is not even SEV-specific, given that load_stage1_idt() is al=
so a C function.

