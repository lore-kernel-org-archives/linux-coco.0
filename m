Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC3553A8
	for <linux-coco@lists.linux.dev>; Sat, 28 Oct 2023 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YsJghcFY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1xqjRVFu"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698502042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qAZ8/ypQKsb51hCx92Cob0mTqPJOPxsmPa1MSwvVBmI=;
	b=YsJghcFYnSnqaFixz9uQHA7H4GDu4EHF504t285r81imS4UrUXnPT7YZN34If4C/dh+bOP
	K5ZdubvR6YTKatdEDUX1TC7aRCAyU5/iYVjBzvRMnmc2D45lUbRwQG+3B2wOs+kERUPnOu
	vUu92xav5dw2XbLRya3dl0Ntcxr/dpI9kSWW0r2h9hEPu0Vo2+4wG9FpVoVhvo2hNBd0gd
	8toq2qfb5G0Ca0iLOmPt/iklKwmQZoQAc04gz4EWI+/wM/mw8DgWNz6+X5jfaz0HrwnUcE
	oODwu7U1noneAif+trmRttQ7fMZOD9YS5PqnruGGQYzWNJDUpZTHtszTjNQtUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698502042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qAZ8/ypQKsb51hCx92Cob0mTqPJOPxsmPa1MSwvVBmI=;
	b=1xqjRVFuL6iiObo0Dw71zi0nfUttrZD+bjTM8N6jPRzmNK6+9jzAnIn6ESFXTGWIc3WdYN
	G+CPAZn6ODbbhjAg==
To: "Huang, Kai" <kai.huang@intel.com>, "kirill.shutemov@linux.intel.com"
 <kirill.shutemov@linux.intel.com>
Cc: "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "ashish.kalra@amd.com" <ashish.kalra@amd.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "Hunter, Adrian"
 <adrian.hunter@intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "Christopherson,, Sean"
 <seanjc@google.com>, "bhe@redhat.com" <bhe@redhat.com>, "Nakajima, Jun"
 <jun.nakajima@intel.com>, "peterz@infradead.org" <peterz@infradead.org>,
 "bp@alien8.de" <bp@alien8.de>, "Edgecombe, Rick P"
 <rick.p.edgecombe@intel.com>, "rafael@kernel.org" <rafael@kernel.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "x86@kernel.org"
 <x86@kernel.org>
Subject: Re: [PATCHv2 02/13] kernel/cpu: Add support for declaring CPU
 offlining not supported
In-Reply-To: <e3ffb5c47126f03ef998f4ae5df81b9c9bd20da7.camel@intel.com>
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
 <20231020151242.1814-3-kirill.shutemov@linux.intel.com>
 <0a29fef814e51a2aa0030ec9cc97366718859411.camel@intel.com>
 <20231023153142.bes7zxcjc2soihsl@box>
 <e3ffb5c47126f03ef998f4ae5df81b9c9bd20da7.camel@intel.com>
Date: Sat, 28 Oct 2023 16:07:21 +0200
Message-ID: <87cywy263q.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 23 2023 at 22:07, Kai Huang wrote:
> On Mon, 2023-10-23 at 18:31 +0300, kirill.shutemov@linux.intel.com wrote:
>> On Mon, Oct 23, 2023 at 09:30:59AM +0000, Huang, Kai wrote:
>> > IMHO it's a little bit odd to have two mechanisms in place, even in this middle
>> > state patch.  Is it better to completely replace CC_ATTR_HOTPLUG_DISABLED with
>> > the new cpu_hotplug_offline_disabled in this patch? You can explicitly call
>> > cpu_hotplug_disable_offlining() in tdx_early_init() so no functional change is
>> > done.
>> 
>> I can. But I don't see how it makes a difference.
>
> Personally I think this is better because it is odd to have two mechanisms in
> place even temporarily especially when we can avoid it.  But no hard opinion. 
> Up to you.

It's not at all better because having this clear split makes it simpler
to review and ponder the individual changes.

Thanks,

        tglx


