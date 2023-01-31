Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE03808
	for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yIv3LIr3qWgmHuEbe2VAns23Loew5Phrl74MLrKWWD8=; b=dIKlPDN1JvAxGw5inlYXDcwU4t
	JV1Y7of4EGQZwP+xRWTx2dtjuHLTYTLo02H4E9BQ+GMAToe8yPsuEPgG1RfqBRttJA4T9PYo9TWxV
	2XHnbEp9zXkaAvnWtqC6dR/OH8asvM85qbqpWDcB2P9inqPzEGPTHTvtiFZoR10dm6xQf+lF0PgWK
	Y2Alu3/L7rR7gGEJpg+1WVCHAt333Y56eocnk8o5VVWyRXMlwERzy/QGq9yLe/yM8fPnSHXhko0av
	oPh8Z35zcqVKIHfAmiodzt4GdErWPHE0yzZp3/4eGxqWLrLmViJlNfr/ZDVG/GQJQY/BRlkCYsKrM
	iL52cKRQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm5k-00B9Of-GC; Tue, 31 Jan 2023 08:34:13 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 73934300209;
	Tue, 31 Jan 2023 09:34:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 62BEE2083586E; Tue, 31 Jan 2023 09:34:12 +0100 (CET)
Date: Tue, 31 Jan 2023 09:34:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] x86/tdx: Do not corrupt frame-pointer in
 __tdx_hypercall()
Message-ID: <Y9jShNfS/d8LGu8w@hirez.programming.kicks-ass.net>
References: <20230130135354.27674-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130135354.27674-1-kirill.shutemov@linux.intel.com>

On Mon, Jan 30, 2023 at 04:53:54PM +0300, Kirill A. Shutemov wrote:
> If compiled with CONFIG_FRAME_POINTER=y, objtool in not happy that
> __tdx_hypercall() messes up RBP.
> 
>   objtool: __tdx_hypercall+0x7f: return with modified stack frame
> 
> Rework the function to store TDX_HCALL_ flags on stack instead of RBP.

Also, on IRC you mentioned that per TDX spec, BP is a valid argument
register too and you were going to raise this and get it fixed, TDX
hypercalls must not use BP to pass data.
