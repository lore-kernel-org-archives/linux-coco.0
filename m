Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37DA1862D
	for <linux-coco@lists.linux.dev>; Wed, 15 Nov 2023 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fl7yn3wJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fhDP8pl7DmtQJLtjZ7NvRUrsrSgQFICjei3CoSbh6X4=; b=Fl7yn3wJedcCW077qb0CEnptMW
	15Iro+TMi2+101PsQ6KRgqyJ91TvxOKYbE7hpqFOSj6mbd2tJkFM//Dqx1pnEB4hmVOP6w/askEZ2
	dwgaH5NSzYOv39+uTod+A9GPAWKrxwFuILTlQWEaxyndyG3UwgmYyJ8DO5ftw0oQQAPsxiwdTz5gY
	MFa2PG2TouZAEStOBo5Q08RnpasMyt+xnDH/HQyF7PACYRvj0/QxlE5hivGMfkZ5mg7USwriXJntz
	U6qyn68g2/7njPfjG4H5Y+A9o1pdTpC2Qb2lSg1pZBIMNmi4rq+Vbp1GF44X47N7sqSTp7cvUzYnU
	NEY7peRg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r3Evn-00E7nE-Mo; Wed, 15 Nov 2023 12:23:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5CB21300427; Wed, 15 Nov 2023 13:23:43 +0100 (CET)
Date: Wed, 15 Nov 2023 13:23:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 06/14] x86/kexec: Keep CR4.MCE set during kexec for TDX
 guest
Message-ID: <20231115122343.GA8262@noisy.programming.kicks-ass.net>
References: <20231115120044.8034-1-kirill.shutemov@linux.intel.com>
 <20231115120044.8034-7-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115120044.8034-7-kirill.shutemov@linux.intel.com>

On Wed, Nov 15, 2023 at 03:00:36PM +0300, Kirill A. Shutemov wrote:
> TDX guests are not allowed to clear CR4.MCE. Attempt to clear it leads
> to #VE.
> 
> Use alternatives to keep the flag during kexec for TDX guests.
> 
> The change doesn't affect non-TDX-guest environments.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> ---
>  arch/x86/kernel/relocate_kernel_64.S | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
> index 56cab1bb25f5..bea89814b48e 100644
> --- a/arch/x86/kernel/relocate_kernel_64.S
> +++ b/arch/x86/kernel/relocate_kernel_64.S
> @@ -145,11 +145,16 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
>  	 * Set cr4 to a known state:
>  	 *  - physical address extension enabled
>  	 *  - 5-level paging, if it was enabled before
> +	 *  - Machine check exception on TDX guest. Clearing MCE is not allowed
> +	 *    in TDX guests.
>  	 */
>  	movl	$X86_CR4_PAE, %eax
>  	testq	$X86_CR4_LA57, %r13
>  	jz	1f
>  	orl	$X86_CR4_LA57, %eax
> +1:
> +	ALTERNATIVE "jmp 1f", "", X86_FEATURE_TDX_GUEST
> +	orl	$X86_CR4_MCE, %eax
>  1:

	ALTERNATIVE "", "orl $X86_CR4_MCE, %eax", X86_FEATURE_TDX_GUEST

?

>  	movq	%rax, %cr4
>  
> -- 
> 2.41.0
> 
