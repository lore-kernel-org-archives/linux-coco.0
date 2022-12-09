Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502C463C5
	for <linux-coco@lists.linux.dev>; Fri,  9 Dec 2022 17:06:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B03B5C011D;
	Fri,  9 Dec 2022 12:06:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 09 Dec 2022 12:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1670605613; x=1670692013; bh=LN
	L5gN6Nhu/7R1gBHXr8q/FbZLzZods29bpt1zTp30c=; b=KLd4y28Gp0Dds4/C5O
	bR976JCAVjX0ktO98UMzkZXPEg/L6ye8XWlM26X2mEU15FMAgqKsxyMACrbxsW3A
	tZRhOL0ZRTLCLVhHVhJBXP8VtVaN8CDDj9KDAih6QOU9pz1mWv0US6hPB6fbqeGA
	ZgQtsLbmHDwCgG00raS5cqh4VJabzFA/+/QI9n4q/Me8hqrrYKOJgS19tFMnmYOQ
	mSPgZqbqeKQ8+6HT50F5SEsFCMptb7Z8esr8A2fGpdrEkg4QXwoILEzViSldOmMy
	Jr7j5reYQ8m6PK+5YqwN2mOJIZMPUccOsHMG7cz/JChjI+RcZDAHSoW9WMbPlChS
	aKBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670605613; x=1670692013; bh=LNL5gN6Nhu/7R1gBHXr8q/FbZLzZ
	ods29bpt1zTp30c=; b=mKIej8kFLSHEeMnS4Vkz5siXb/MDdtfF8F7c1IDoEOSy
	ZEjdTmxLCd191f/AEC+InG+w2UjK3yLHfQv2uTEVYOu+iIBMlDoD0JZDBkeKOmg0
	wZVLrng9tT5hjfzRHs1QOFuZ55q/jTgLCMlnwWFAuTICysMMQkRVzch4l4P+5HI0
	HqQM9ayLgxfoKHphLvR5Hvmwh0xqNs/TXhL2eSCrg82bGn2H9nxSTooL+wxEuezC
	ImXfkZdRxpk0QGoTN3JSY5oNsQ6qNd2fwNxiBwvsmQHpJNiUo3eHPe20l5CDdsEE
	CGQi9EttISe+KaMa4kwEgFVLXM6X+nbtA0BfE73iSQ==
X-ME-Sender: <xms:K2uTYxwJ826xFo2Huxm9_9lnc7_SSdDJwS5V0SmAbLEOg4Jg3degRQ>
    <xme:K2uTYxQlcI0cW71rVnGcwfJiuVmipvsJ98GxRwO01I76xyPonxQGmFeTgSAjQx6Ce
    z6g9WFkyuMYrz5MH98>
X-ME-Received: <xmr:K2uTY7UZ4HcaW9wGobxIurt64NRmNfJUAJgosQkoync9kBNKDAKzzxpk4IRZH5ZNQQQvCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttddttddttddvnecuhfhrohhmpedfmfhirhhi
    lhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrdhnrg
    hmvgeqnecuggftrfgrthhtvghrnhephfeigefhtdefhedtfedthefghedutddvueehtedt
    tdehjeeukeejgeeuiedvkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgv
X-ME-Proxy: <xmx:K2uTYzj8Qk9I9EBn2cDSFkzs97iN6kI0sfJ7JQZW3DiMYIgj3aCvJg>
    <xmx:K2uTYzB4Az5hvKM5KT8tp9c00JP2dy6DRHg3kVrN_PtbJVJE1XdCrA>
    <xmx:K2uTY8Lom3K9gLcS4P3PQEZqh1RmN5Alk-PByui2gN4rDFS2ID1olg>
    <xmx:LWuTY33ZzO30VwHYPD3cLKR50Mcv5sGqvu_PDiRtUVfMXRWn3ikokg>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Dec 2022 12:06:51 -0500 (EST)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id ADDF0109CE2; Fri,  9 Dec 2022 20:06:47 +0300 (+03)
Date: Fri, 9 Dec 2022 20:06:47 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] x86/tdx: Use ReportFatalError to report missing
 SEPT_VE_DISABLE
Message-ID: <20221209170647.r32yjyc3hsqtnffo@box.shutemov.name>
References: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
 <20221209132524.20200-3-kirill.shutemov@linux.intel.com>
 <e79c4b97-5718-9a60-406f-1df994ba089c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e79c4b97-5718-9a60-406f-1df994ba089c@linux.intel.com>

On Fri, Dec 09, 2022 at 07:42:56AM -0800, Sathyanarayanan Kuppuswamy wrote:
> 
> 
> On 12/9/22 5:25 AM, Kirill A. Shutemov wrote:
> > The check for SEPT_VE_DISABLE happens early in the kernel boot where
> > earlyprintk is not yet functional. Kernel successfully detect broken
> > TD configuration and stops the kernel with panic(), but it cannot
> > communicate the reason to the user.
> > 
> > Use TDG.VP.VMCALL<ReportFatalError> to report the error. The hypercall
> > can encode message up to 64 bytes in eight registers.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > ---
> >  arch/x86/coco/tdx/tdx.c | 38 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > index cfd4c95b9f04..8ad04d101270 100644
> > --- a/arch/x86/coco/tdx/tdx.c
> > +++ b/arch/x86/coco/tdx/tdx.c
> > @@ -22,6 +22,7 @@
> >  
> >  /* TDX hypercall Leaf IDs */
> >  #define TDVMCALL_MAP_GPA		0x10001
> > +#define TDVMCALL_REPORT_FATAL_ERROR	0x10003
> >  
> >  /* MMIO direction */
> >  #define EPT_READ	0
> > @@ -140,6 +141,41 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
> >  }
> >  EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
> >  
> > +static void __noreturn tdx_panic(const char *msg)
> > +{
> > +	struct tdx_hypercall_args args = {
> > +		.r10 = TDX_HYPERCALL_STANDARD,
> > +		.r11 = TDVMCALL_REPORT_FATAL_ERROR,
> > +		.r12 = 0, /* Error code: 0 is Panic */
> > +	};
> > +	union {
> > +		/* Define register order according to the GHCI */
> > +		struct { u64 r14, r15, rbx, rdi, rsi, r8, r9, rdx; };
> > +
> > +		char str[64];
> > +	} message;
> > +
> > +	/* VMM assumes '\0' in byte 65, if the message took all 64 bytes */
> > +	strncpy(message.str, msg, 64);
> > +
> > +	args.r8  = message.r8;
> > +	args.r9  = message.r9;
> > +	args.r14 = message.r14;
> > +	args.r15 = message.r15;
> > +	args.rdi = message.rdi;
> > +	args.rsi = message.rsi;
> > +	args.rbx = message.rbx;
> > +	args.rdx = message.rdx;
> > +
> > +	/*
> > +	 * Keep calling the hypercall in case VMM did not terminated
> > +	 * the TD as it must.
> > +	 */
> > +	while (1) {
> > +		__tdx_hypercall(&args, 0);
> > +	}
> 
> Instead of an infinite loop, I'm wondering if the guest should panic after
> retrying for few times.

Hm. What difference would it make?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
