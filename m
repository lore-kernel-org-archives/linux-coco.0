Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC8C12F598
	for <linux-coco@lists.linux.dev>; Tue,  9 Apr 2024 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672548; cv=none; b=H6L7WVuueYCgMsHiN+uaMLHnZtKvo3dCMfMWpY/wxFw0hhfNhpalT/1AR06EYG4flccjiw3PN33xId/QkzKU3U3eH5UyNSYEQ49UffkThS3I6OCBeq7M7yeA2vaFyZnEtUViwzz9MBEriFQjLFEvgb+GUgxm+OXNDw0gwkB7snM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672548; c=relaxed/simple;
	bh=zqSRsfssEgGBYxYTJL13zKkEImkEMLvoC/JiWtFn3dU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n1qqBYhiTmY0WGbWh/+bwnyGc+AFJjFHJ4l/dsxlNfP8iY1y7sCnVNOkfP+5JmKLy3ny1Gx8JyVx8HOsR9eSW0VXHJTxkberStwre+CiH4YZoZfj9RBB2Wq2MMoJ6WWHB1ta+bahP/jVNz3wOK19p0/rzZ9JUeqlOCHYVGq1yOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Egc+oG3N; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Egc+oG3N"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1e44b8ebf43so12973295ad.3
        for <linux-coco@lists.linux.dev>; Tue, 09 Apr 2024 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712672546; x=1713277346; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rzf284ZBrPEw96jPmf6sJWqKEUO80DMFZq6QcuaB1j4=;
        b=Egc+oG3N6EoEcjK0zNXMaVoPtaCdOqOq2+jJoGbGQwDLJJa+gUIBWUO/LHnsrWfX04
         wnAtrkmNulJCXzJ3Bh5pQ4RlI1avOPiEwF9xIoozURxNElbrTDCVdcp+1UrhmCoIeh6i
         xjnLUonzibIfgW22W3YuqkfVMEaIDdCmk81cnzDOXCwghUlh/OxwCZNMNc4njS5IwHjh
         AL/eD+GLRMRDp/8mUy8qEQQtNmsN/gUM2P/HBG198117LypYRxmjgRty1X8Y9CJqh9th
         ygAy1I4rNGZPK1M0AUulhwACoX8LtaDkBL9qcX1GpfHlHG5cOEmmIW0ZbdkttjhG7+br
         A0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672546; x=1713277346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzf284ZBrPEw96jPmf6sJWqKEUO80DMFZq6QcuaB1j4=;
        b=nXialIfVcy1lUx267MrHelxT2ciHF3VmS++7xp1DCqQQSYcTWJCVuFaZcrKYNNxjNN
         ocE91qMkfJB1o0AhHEKZSCRcU22P5fFrD2sOw7ldTKLuX0wL3f81vi6DFrb6Dt/KJcZA
         +UaJR+7v5xA7QFUI84EMkxf7Lm7alCYXPQsKbXwRZ/zf5WP4dSfAk5ddYN6tZpNk8sD5
         eCCrTemPmTPE7R6GGwOlV3Loz2xFUM6LoM9h9DrGEfHm3jgdbHqpE6Pi/PTktNZB+A80
         PnDqWB0QwFYLSyn6+OkDzSVWemmAEU8Owy/rRxCwGypTAGMWybIGzglol9dGlDSwvKRb
         Bb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIR6xDRPlkYuG19X51BcNfBibOMbiXdMTiSBQNHBdhIw6XBlZh+vJ2h4+9t4koq9G/9HB/yj6Qk2dR0qbXSzpMhcrIwy1L7r2l1A==
X-Gm-Message-State: AOJu0YysdnYR2TseWf1ZIuAKYfBJVtG5QnGeIIRhwOppLd4o1+b3Jxjt
	d3oFMqAxKE4NIxUGOfxAKIBpPjO8ZntMRARUj5+9i2IKsCYpD0r/MNd3iWvSQnQ5QtPynb5drIn
	P6w==
X-Google-Smtp-Source: AGHT+IFQbZfL17SFF2bj/UJ0pxxiOljLr4AR0LD/VuM1TYSQ/VvBmRf2Ryf8KUJHwwaq9RypgUOGlGE46Kc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e807:b0:1e2:588:b5bb with SMTP id
 u7-20020a170902e80700b001e20588b5bbmr693928plg.8.1712672545971; Tue, 09 Apr
 2024 07:22:25 -0700 (PDT)
Date: Tue, 9 Apr 2024 07:22:24 -0700
In-Reply-To: <20240409113010.465412-6-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240409113010.465412-1-kirill.shutemov@linux.intel.com> <20240409113010.465412-6-kirill.shutemov@linux.intel.com>
Message-ID: <ZhVPIDDLkjOB96fI@google.com>
Subject: Re: [PATCHv10 05/18] x86/kexec: Keep CR4.MCE set during kexec for TDX guest
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Kai Huang <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 09, 2024, Kirill A. Shutemov wrote:
> Depending on setup, TDX guests might be allowed to clear CR4.MCE.
> Attempt to clear it leads to #VE.
> 
> Use alternatives to keep the flag during kexec for TDX guests.
> 
> The change doesn't affect non-TDX-guest environments.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/x86/kernel/relocate_kernel_64.S | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
> index 56cab1bb25f5..8e2037d78a1f 100644
> --- a/arch/x86/kernel/relocate_kernel_64.S
> +++ b/arch/x86/kernel/relocate_kernel_64.S
> @@ -5,6 +5,8 @@
>   */
>  
>  #include <linux/linkage.h>
> +#include <linux/stringify.h>
> +#include <asm/alternative.h>
>  #include <asm/page_types.h>
>  #include <asm/kexec.h>
>  #include <asm/processor-flags.h>
> @@ -145,11 +147,17 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
>  	 * Set cr4 to a known state:
>  	 *  - physical address extension enabled
>  	 *  - 5-level paging, if it was enabled before
> +	 *  - Machine check exception on TDX guest, if it was enabled before.
> +	 *    Clearing MCE might not allowed in TDX guests, depending on setup.
>  	 */
>  	movl	$X86_CR4_PAE, %eax
>  	testq	$X86_CR4_LA57, %r13
>  	jz	1f
>  	orl	$X86_CR4_LA57, %eax
> +1:
> +	testq	$X86_CR4_MCE, %r13
> +	jz	1f
> +	ALTERNATIVE "", __stringify(orl $X86_CR4_MCE, %eax), X86_FEATURE_TDX_GUEST

The TEST+Jcc+OR sequences are rather odd, and require way more instructions and
thus way more copy+paste than is necessary.

	movl	$X86_CR4_LA57, %eax
	ALTERNATIVE "", __stringify(orl $X86_CR4_MCE, %eax), X86_FEATURE_TDX_GUEST
	andl	%r13d, %eax
	orl	$X86_CR4_PAE, %eax
	movq	%rax, %cr4

Then preserving new bits unconditionally only requires adding the flag to the
initial move, and feature-dependent bits only need a single ALTERNATIVE line.

And there's no branches, blazing fast kexec! ;-)
