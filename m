Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9796CD2F7
	for <linux-coco@lists.linux.dev>; Thu,  6 Apr 2023 20:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7Lv6drb3gEaVy64/Alzs7G5KLAupjBD12B3bx6sUEhQ=; b=Bt74+QxU+3R06I+jYD7uFNC17/
	E1cJPHW3ucr0St3bSM1ejknGvvR3+AtCE3J8eme6D0Fy0scMhkaAOF1rJbWic1BO2c1aj5PhSGQA7
	ypcidG6INsE9F+ysmBtxPH7CgWkdm+VHHiPhTWQoK+j2Tf0njrUC2p452+sOpuSCdeOKTKZ2Ie5Pm
	lIwHWreo5PEN99i6q3DHI4fxaJyrV32WSXQGweZ58PENVcZaa/sRrz8BuJryzyw8V6t09mFjuTAKN
	6326uiemrDXe5/hWppaxCD2HneX+QMeuY+oGRaYPeDOeLzMtuL6DFDjJkC+Bs0hhzl+0hW9fD3LyD
	OyvcV/vA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pkWaE-000ADg-Ey; Thu, 06 Apr 2023 20:51:50 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 98BAE300274;
	Thu,  6 Apr 2023 22:51:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7A0D42692D85E; Thu,  6 Apr 2023 22:51:48 +0200 (CEST)
Date: Thu, 6 Apr 2023 22:51:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	"H. Peter Anvin" <hpa@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Andy Lutomirski <luto@kernel.org>,
	Asit Mallick <asit.k.mallick@intel.com>,
	Cfir Cohen <cfir@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	David Kaplan <David.Kaplan@amd.com>,
	David Rientjes <rientjes@google.com>,
	Dirk Hohndel <dirkhh@vmware.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, Jiri Slaby <jslaby@suse.cz>,
	Joerg Roedel <joro@8bytes.org>, Juergen Gross <jgross@suse.com>,
	Kees Cook <keescook@chromium.org>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Stunes <mstunes@vmware.com>, Raj Ashok <ashok.raj@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tony Luck <tony.luck@intel.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 2/7] x86/entry: Add IST main stack
Message-ID: <20230406205148.GF405948@hirez.programming.kicks-ass.net>
References: <20230403140605.540512-1-jiangshanlai@gmail.com>
 <20230403140605.540512-3-jiangshanlai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403140605.540512-3-jiangshanlai@gmail.com>

On Mon, Apr 03, 2023 at 10:06:00PM +0800, Lai Jiangshan wrote:
> diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
> index f05339fee778..3413b23fa9f1 100644
> --- a/arch/x86/kernel/dumpstack_64.c
> +++ b/arch/x86/kernel/dumpstack_64.c
> @@ -26,11 +26,12 @@ static const char * const exception_stack_names[] = {
>  		[ ESTACK_MCE	]	= "#MC",
>  		[ ESTACK_VC	]	= "#VC",
>  		[ ESTACK_VC2	]	= "#VC2",
> +		[ ESTACK_IST	]	= "#IST",
>  };

Since #IST is not actually a vector, perhaps ditch the '#' ?
