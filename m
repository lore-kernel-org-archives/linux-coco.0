Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E140A4CB4B
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 05:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716874430; cv=none; b=PIl5tV1wr6+r9pl70yn7uJk5CePSWs+x5N1/AZiO/hOxtWlzAldlKeeDuGijbfvacqFh5b1yzPs1EIWdFmeUJNBwC/HCbnmYihtsIoqKLxxStN+aGZQxnCEiWaJywdwQjZ+FzF31x/ncdAX21ZeRsjA4A4+U7kmSwm+UmU6jl/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716874430; c=relaxed/simple;
	bh=s05Frly+jsi9ApRgAMiozaXpR67rihNmFY6csDtyDUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhAwOFbkf02D9eUk6uSKnT90TP8IlaG0C3Z5oiNqDLZa5wFT6XIV2pN1LqcnMImbA+JyVjrUOcPSPb1LQU6lgHtjiKMWal6+C4phXZ+572e2YimrlUxmuGVsVdR/WGs2F2G8aUKSOx+591XpUObephZ4Zgs9/lkXS33vAF8TxD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2bdf446f3d1so310284a91.3
        for <linux-coco@lists.linux.dev>; Mon, 27 May 2024 22:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716874428; x=1717479228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fN6LRL+FsIHhjPUj0yA5DeMxhwLzqKe44DGJ+zjen+s=;
        b=J73953tuOvgK1QpGmwTsgBRzAu6Mk1jCqWOr3gf6i2kz6l8lYaF85GGGeXvYDR3dxc
         6Nn4Zbne6ICWehcfJBw+VOhVI1sIDD7U6N4I+jjhAsCHFUP0zSDjO7Ep17m5hiPLK3y8
         BQDZu6KUhI+TKxZ1D8zSHkgjqqOICXHjbeUQBxBZPZ+eJhotCjENYRtnk04NGan0HVKe
         W3oBYATn2cSupHlr/5Wva11gqLq09QMOsG2Zdxzd733/eDGfP61KLnQoonqNLrT2CfOQ
         N6E16nSvqJJKLa5dQQCg+oBPb9PU0CjNvQn+RvPfaRfQzeH/FSui1KtQQgHgl3yIIEAs
         /zgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk13+CIm+J1r0eeWET+C1s//1uSkDWf8scUI+Qt+aOhakHVC8nOjVpqGRgOWLoQK/Rzy30XZwzFT+dYHAwmtN4Ql4PjljtFamHPQ==
X-Gm-Message-State: AOJu0YzEJirKpJ/Bud88hxOd6LCSl/qxbaOpyQQrPgQHFVAPQ+a9BU8i
	THHwie4wF72yKDlGI7bFQUW5uIyx4z1opcCEZnZpuqHZm26sQmxR
X-Google-Smtp-Source: AGHT+IHse1I9e6UDY482/9q4rxCeoBsLH1h8sqxmlnuIt2y7ohHDp0RwxMIzcOm0aIibGNazirrQgg==
X-Received: by 2002:a17:90a:d143:b0:2c0:11d4:b2e0 with SMTP id 98e67ed59e1d1-2c011d4b31bmr354237a91.34.1716874428096;
        Mon, 27 May 2024 22:33:48 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9ed2cc7sm8835972a91.3.2024.05.27.22.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 22:33:47 -0700 (PDT)
Date: Tue, 28 May 2024 05:33:46 +0000
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
Subject: Re: [PATCH 06/20] x86/tdx: Convert MSR write handling to use new
 TDVMCALL_0()
Message-ID: <ZlVsurj64QycDQRr@liuwe-devbox-debian-v2>
References: <20240517141938.4177174-1-kirill.shutemov@linux.intel.com>
 <20240517141938.4177174-7-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517141938.4177174-7-kirill.shutemov@linux.intel.com>

On Fri, May 17, 2024 at 05:19:24PM +0300, Kirill A. Shutemov wrote:
> Use newly introduced TDVMCALL_0() instead of __tdx_hypercall() to handle
> MSR write emulation.
> 
> It cuts code bloat substantially:
> 
> Function                                     old     new   delta
> tdx_handle_virt_exception                   1947    1819    -128
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/x86/coco/tdx/tdx.c | 9 ++-------
>  arch/x86/hyperv/ivm.c   | 9 ++-------

Acked-by: Wei Liu <wei.liu@kernel.org>
