Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C14517E8FF
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716874415; cv=none; b=mjxF9jKeMaUe/DUxesYaizFwMvboASo4/41xbFVyDIpdLX0fQRo5E+i0BOzCi3JTaKCwGVCMRe9CsqSeshcJkXKyGb5cHKmTMPNo0slIgyzIF2hw99WLeQYAKUPvrHwCX4UK6K2Rzck1txWanFFs4mn5KKs/o5y01AREbvbkwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716874415; c=relaxed/simple;
	bh=8LC1IXOriw4pChGUu6KrCD/lFtUczRYV7fhf7+E9wUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnCzWYYl2BqymRKA10uJPVURYZxSsQE8NzeIPJrC8RuPUSLoB1KtQE21tHdbb+z+YsF98VqYfrCKUTmRcYgrOkiPYem4MQVVRNObNrOkGe9WDhwKSWkSUixrCNrrmXLvTQ3JML+jOccg16nXtP5FVMsiPQuIaKJLwR4QLLj6xrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-24ca079af98so237201fac.3
        for <linux-coco@lists.linux.dev>; Mon, 27 May 2024 22:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716874413; x=1717479213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptjC09kdGjdpXiVrATn7mphaV9X4ACIvPxTCurbJjBs=;
        b=qGOSGytglDZqjMWRAr423CU7lRkZjNke6zRLzC/QUFb3nHgVyKcMR6dnlkkheWQoli
         86TkOefUXtm4wt7uZ148fodmq2Nb8M0mHhDhclfz+wQBOYihb4jfdJ2i0ww53BFaOkaL
         bRRez/ljL8YHwfdWrUPpHZA6KApWRzdw4gcssGbNgsDh2Ni0ZhHVtqf9a9A/DnX5l8e7
         t98M4jr+cRe+4G48pui+/pYwgWLx/zKQbWeOUntMZwoGe30Met9bKu2uspq6v+f+q3fC
         vAdrpHbqC0OglMwWfBU5J8MpUz+R7Wf8WIs1yXoEG3MslpHrjkjn+eFxK4ptm5CKrJF3
         YQrA==
X-Forwarded-Encrypted: i=1; AJvYcCWUPsjSaVgSzYVNXun5Zt7CRdXBUmYaqJj6v0tfJnm1VwF4HjAFLsRq+fYYQ9bs46t2vrnn/U8rvKEADlwRxbRjGcZO1u2an+Hq9Q==
X-Gm-Message-State: AOJu0YxDIjt9DKV41TA2536S6ihSMAXwcjPS+nsunZwGfBRuIOsb4BS6
	1z90nUDVc74yYN1zBeSpz+Je7TnOaootrUzGLSsifyWjJVGoQlTO
X-Google-Smtp-Source: AGHT+IGM6gvEo9DzXV02LAfnEdgOeXVU9tLNw5T+R2ZMb83bodzfFygmaQpQMaamwlG42uS+oTA7Xg==
X-Received: by 2002:a05:6870:4722:b0:24e:4fef:61df with SMTP id 586e51a60fabf-24e4fef737fmr9044548fac.54.1716874413334;
        Mon, 27 May 2024 22:33:33 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-701908d14c2sm1791616b3a.152.2024.05.27.22.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 22:33:32 -0700 (PDT)
Date: Tue, 28 May 2024 05:33:31 +0000
From: Wei Liu <wei.liu@kernel.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH 05/20] x86/tdx: Convert MSR read handling to use new
 TDVMCALL_1()
Message-ID: <ZlVsqz06Ueuetkz1@liuwe-devbox-debian-v2>
References: <20240517141938.4177174-1-kirill.shutemov@linux.intel.com>
 <20240517141938.4177174-6-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517141938.4177174-6-kirill.shutemov@linux.intel.com>

On Fri, May 17, 2024 at 05:19:23PM +0300, Kirill A. Shutemov wrote:
> Use newly introduced TDVMCALL_1() instead of __tdx_hypercall() to handle
> MSR read emulation.
> 
> It cuts code bloat substantially:
> 
> Function                                     old     new   delta
> tdx_handle_virt_exception                   2052    1947    -105
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/x86/coco/tdx/tdx.c | 15 +++++++--------
>  arch/x86/hyperv/ivm.c   | 10 ++--------

Acked-by: Wei Liu <wei.liu@kernel.org>
