Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F672E6CDF
	for <linux-coco@lists.linux.dev>; Wed,  7 Jan 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787590; cv=none; b=BNY2NoynSdz2+U63QJjbL6mvjBWFHbBUfGa+6h8sws75NfPZlRJskLcHBMOX3kdBq3qEORFlIFwXGUI62Y4E7jb7ZP6iwtQa4vMPSP6XdVwzcKV8T+832Z06nqksAsYPIjZa5AvA1wNSLk7DrtZd9GK+bN9ZU4lZdG9k5ArKM6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787590; c=relaxed/simple;
	bh=6Ge8FA/ecddM/sITdDyUVFMaBdJuuQr8rEWowEz8FXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZuAzcyVNaLrwmqUuBdN8WwuHkvwiYZ2pKSa7ELYZgikz7md1rQ2kjaKBOoHB1fdJ3EiVOByQbf5UY/4tnFMnZ0wgasYzL+sQlXz4D0HTjnktt7e63dzE1kLwGC1TtEs4fY6gO3+BgLnjsYvmJcm6XmEk9oIrQ0kV+3x3c2coyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=mBMmpfKu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o5bX5r+7; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="mBMmpfKu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o5bX5r+7"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2C3827A00B9;
	Wed,  7 Jan 2026 07:06:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 07 Jan 2026 07:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1767787587; x=1767873987; bh=WooVei3vFmSN2Bw4n56p7n5cWjbyKhoX
	ks3fT4U0qy4=; b=mBMmpfKuNbfwd9tb0B49qZBAz/fB6J8NOwwrP1gQIfjMMr1W
	w62mQTuhWkFqnrWN7EZXxlcFO/kG8Fz0+Qna1/BYyJjHQml9CH33g1QySMglSsby
	tkV/LstaXgUYldIK9kq8br9085ABVXLZvXPVIWqiVlQzHyMJRm02WF9/B7N3b9+s
	zHqkIUHYNrdQWIi5UzDF+t19ccbz4xLVWac4nk8KoZJDMGx4UnFHI0y40R/zawgq
	KrVpq9Q5dqCKvYLrpOn2xtsm9PK049i1b0x7Nl43XqIpuXQ/TdqB1TsRSqtHFUQY
	1p7lnCG+kkfWDiKEewhG0DcIKnr4k4gdkGIOQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767787587; x=
	1767873987; bh=WooVei3vFmSN2Bw4n56p7n5cWjbyKhoXks3fT4U0qy4=; b=o
	5bX5r+7T8LWYVUL+6yUw5UoawXBQ/vW3JB/wR+vLCySN7Ky3sMaUqPk1DgbLX0b5
	Yunnu75pUuX1J6+XdP6if6uTP+n7/WnEHkh354DWLTOvffzK+11fhbadTAnuSpyz
	x3hJwfuq21ubVlDVG//NaikjgtKxfrbZSd+rf3qW2eSysm9uhxs0PgfJySm0fmKz
	9g7fm4tAxnKxHqZbRbcCWE2Ks2OHMS8x3EWQW6iRLMtjsB2qK2MRgzdMS1ENr01y
	3/2SBcfzbgFOVdkvNk/KLqmvtKUl1dJDVUgONnYt/WB0blFOMy9UDPWYDmAAYBQu
	QxVRO708bZVq9WsPuhZzQ==
X-ME-Sender: <xms:Qkxeacgt93Qc77L9EjXdhyOzH2-bDu-L2gRVDCGMRWhpgOb4rK-MNw>
    <xme:QkxeaQA_nPavDBi-vilzYq48hR2aQ4QryO94-Ytsw9F4Ff714eK0vZkc5Jh-BqnQ7
    GvTQP8tzle0eruz1xdStOxnyBTADBhhxb3oOgjMYxh8V59z3BHZcn8>
X-ME-Received: <xmr:Qkxeaasl6UMFENQLX0R3xF_iRYjHq7qMXvfwv7MxEbo93j1F3Q04aYjHMX9M-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeftdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkefstddttddunecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvqeenuc
    ggtffrrghtthgvrhhnpeekffegjeelvdfhieehtdekgeethfdthfehhffhgfetleekledu
    fefghefhtdfhjeenucffohhmrghinhepmhgvmhdrphgrghgvnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhho
    vhdrnhgrmhgvpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphht
    thhopehjlhgrnhhgvgesmhhitghrohhsohhfthdrtghomhdprhgtphhtthhopegurghvvg
    drhhgrnhhsvghnsehinhhtvghlrdgtohhmpdhrtghpthhtohepuggrnhdrjhdrfihilhhl
    ihgrmhhssehinhhtvghlrdgtohhmpdhrtghpthhtohepshgvrghnjhgtsehgohhoghhlvg
    drtghomhdprhgtphhtthhopehpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhrtghp
    thhtohepjhhohhhnrdhsthgrrhhkshesmhhitghrohhsohhfthdrtghomhdprhgtphhtth
    hopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgr
    nhgusegrrhhmrdgtohhm
X-ME-Proxy: <xmx:Qkxeaa69CWVrXC3IqSrKIycAfMYvEHnS5HevtaYlD-sdRksSC7frEA>
    <xmx:QkxeaUc96dWbgDntQDPrIj2o7INnX3y6KHe7J6o1AWVKD5FQbovxTQ>
    <xmx:QkxeaSUQcwktGGvl2_ZNvUskpgr9D7IuKo_SI4E_X6P9ccAs3naOLQ>
    <xmx:QkxeaRVq5YYkB2Po_mdoHOUE9iJafS1J0w1mtsz-as047RHWDLTxFw>
    <xmx:Q0xead5QwxG2zFZ4ODp-tex8T6THnng-49AoMbijXKlpW8Qm9FVg3m4D>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 07:06:26 -0500 (EST)
Date: Wed, 7 Jan 2026 12:06:25 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jon Lange <jlange@microsoft.com>, Dave Hansen <dave.hansen@intel.com>, 
	"Williams, Dan J" <dan.j.williams@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, John Starks <John.Starks@microsoft.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Message-ID: <mykdbrirwar4ymxz4zmkngytdvbixz5lcavawzzjlhefkhisjv@sil5ftirxozp>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
 <CH8PR21MB522275E86FF5D33B04CE7A75CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
 <43ae1b15-c911-4ecd-aaaa-15bc23ec6192@citrix.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43ae1b15-c911-4ecd-aaaa-15bc23ec6192@citrix.com>

On Tue, Jan 06, 2026 at 10:39:08PM +0000, Andrew Cooper wrote:
> On 06/01/2026 2:12 am, Jon Lange wrote:
> > Andrew wrote:
> >
> >> Are we saying that, inside an opaque blob that a customer provides to a CSP to run we might have:
> >> * a paravisor and an unaware OS, or
> >> * svsm and a fully-aware OS, or
> >> * something in-between these two.
> >> and we're looking a way to describe which piece of the interior stack owns which capability/service?
> >> I think the discussion would benefit greatly from having a couple of concrete examples of data this wants to hold,
> >> and how it is to be used at different levels of the interior software stack.
> > Here are two examples.  In both examples, the OS is running behind a paravisor but I wouldn't term it an "unaware OS".  Rather, the paravisor is present because of the set of services it provides, and it is running in paravisor mode (not SVSM mode) because the implementation benefits from taking full management responsibility for the confidential trust boundary (e.g. determination of when/how to validate/accept pages).  In such a configuration, where the paravisor has management responsibility for the confidential trust boundary, all of the enlightenments in the guest OS for managing confidentiality state must be suppressed.  The straightforward way to do this is for the paravisor to suppress the confidential VM enumeration information visible to the guest OS (the "SNP available" CPUID bit, or the "TDX active" bit, for example).
> >
> > Note that this occurs out of necessity because we can't have the paravisor and the guest OS fighting over who has the right/responsibility to execute PVALIDATE, or TDG.MEM.PAGE.ACCEPT, or whatever.  The kernel today only has two concepts of its execution mode: either it is a confidential VM, in which case it takes full responsibility, or it is not a confidential VM, in which case it ignores the responsibility.  When a paravisor (not SVSM) is active, we have to operate in the second mode because the first mode would provoke precisely the conflict we're trying to avoid. 
> >
> > First example: a confidential VM running under a paravisor wants to obtain an attestation report for itself to pass to a third party to vouch for the fact that it is a confidential VM.  Assume in this example that the relying party is aware of the paravisor and the paravisor's measurements, so the evidence provided in such an attestation report can successfully be verified as authentic.  In order for this to be possible, the kernel has to know that it's running in a confidential VM in a mode where attestation reports are available but where the responsibility for confidential memory state management is suppressed.  This is a third state beyond the two states described above.  This isn't just a userspace problem because access to the attestation service is mediated by a kernel-mode driver that needs to know how to configure itself (such configuration today is based on CPUID and not on ACPI).
> >
> > Second example: a confidential VM running under a paravisor determines that one of the devices available to it is a TDISP device that requires the OS - not the paravisor - to perform the operations required to configure the device, to obtain and verify its attestation information, and to consent to activating the device in the TDISP RUN state.  In order for the OS to be able to execute that sequence, the device has to know that it is running as a confidential VM so it knows that TDISP configuration may be necessary.
> 
> Thankyou - that is helpful.
> 
> So overall, we're wanting the paravisor to be able to express "You're in
> a confidential VM, but you're not in charge" to the OS.
> 
> Hiding the SNP / TDX bit is of course necessary.  They have well defined
> meanings which the OS cannot use when it's not in charge.

Hiding "TDX bit" is not necessary for TDX guest. Linux TDX guest kernel
can run both as L1 and L2 guest. Paravisor in L1 can redirect all
necessary operation to itself and it is transparent for L2.

It might be more relevant for the guest OSes which cannot be run as TDX
guest natively.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
