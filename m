Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD1E284B38
	for <linux-coco@lists.linux.dev>; Tue,  6 May 2025 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537631; cv=none; b=bN1dqdUaY/jlr/5d4PnqqgmKWDe7JoSB/1HQ6NRtgkDEhVM2BuY+ob3jOMRDcT7ge9SWd2H4nQDOtJ03XZfD/KuP6ThEMs2K5BJdgmi3k4mUUrlgFkDnyoOB2xWL14JoVdoeUD0AHf0T4Uxse6L03a1CrbQP0/3YPpWDnI2B5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537631; c=relaxed/simple;
	bh=4DeN/DPKw5wRuHPLDO0TZYd7KmFT2iB1A89ex9ARX5Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lL0m5ATaEBA/edQumUaaSjwGhoFKSeIBZdPTL7VYql0p+uvnwxO7DP2E9J44iWR7d6+zAcCX/SJPjF7Lpp4W4gAVNgDTLhwKV7am1T1Eek4CUxoKxztjJu5bbs/f3NfqxhkN8RQ1tfoJNWlP7gl7m8Y6RVztM+trEgWBOH2XIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYI658ba; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYI658ba"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso30050195e9.0
        for <linux-coco@lists.linux.dev>; Tue, 06 May 2025 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746537627; x=1747142427; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIiqBCWX5MzqP0t3XcVAZebiA0Ed8DRzeZF9xiXf3Ao=;
        b=bYI658ba9K8qj7mDYwtog1fSCbKwL+4M+RnPW7ECUQRanAadPDWUHii5OBtvG3s3PR
         cRs2VtOGyLd3bBHBHIKBvxoaZpqA9RczORMGS/S1kOxPA0i1j51Vhilxm3iJmOTTm1H1
         WLNNQuH5gFdf6q9I7YgIl1tVj0e0KCeJ84zgKRh7AazNTQXRtMMiXf8Em6599jyJsXsM
         Xzh4u7SRPlWd0SyOqzSqESKy75Bk6FWatT1RhmMBuIA9CsdVw6OMRPTLbvbYoh4MoNYC
         fDENHe0atUSW4v6rlHBzOlBIazUqjAc2kXbn/7Sg3eWr9nPET3OmzkV5sNHPWTchGYr2
         xLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537627; x=1747142427;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIiqBCWX5MzqP0t3XcVAZebiA0Ed8DRzeZF9xiXf3Ao=;
        b=wjkHiGqEhKUR6XFsYXPA/zY2V6Xm0CA3o19TLO2ZE8x3uHljrvHv3d55Sv4cJ/PYi7
         wmhCuz1Zs/JgOCNs8kl8SSbmBKgA8kUt0HHOrXI9Wxx5rMimTjvmQZwIJIxMZjHq3/cF
         ywhg7G7oji8gWfLTgdZ/0lN5mycSDVFj1D5hQiIJg8tpc2vTIByRmiIdRI8Nl05kVKSt
         B8SP90Ep0DWnZqLOjCWH3y3HBmKl6l9pDFeZu16Qk0hSbtrqVJKkNkFjt8ReQXtpGaDP
         +CjYTfkEPWbCYtoXgysZvW5TB1Q1taQrsgJWR9W7L5Wnrug3TFEPmcPlJuq+X7F84T1F
         tyqA==
X-Forwarded-Encrypted: i=1; AJvYcCVh1pkxvEkxWUFrdPqNy2qpyNx3wCB12L1Md4fyP2vZnpVADpQ4gPcbhC91cvdTyVul4Kh32w/scIgp@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfw/TbGnMcbuYwEsfyxzIlRxvfgj21OlANuV2uzTN3mixHzJxK
	63kCrQwQaTn7a/M3G2l5xUb4FBMSfMPGsQjz2hsUCVmqChlSX526ssbs1HzXr8ubEIaOp+4M7Su
	oPPnZiulCAg==
X-Google-Smtp-Source: AGHT+IFY78pcCTbbccXODWSDVdP1qDT1isRm3G/s4SH8FJC+JVpZUwNfnB50fPQ1ngFDis6ebOiU9A1BaDFDbw==
X-Received: from wmbjg12.prod.google.com ([2002:a05:600c:a00c:b0:43c:eaf6:525e])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e05:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-441d0fbd329mr28022185e9.4.1746537627644;
 Tue, 06 May 2025 06:20:27 -0700 (PDT)
Date: Tue, 06 May 2025 13:20:25 +0000
In-Reply-To: <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com> <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
X-Mailer: aerc 0.20.0
Message-ID: <D9P3X0NLQMW5.1J74MJ7FDRBFB@google.com>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
From: Brendan Jackman <jackmanb@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, <akpm@linux-foundation.org>, 
	<vbabka@suse.cz>, <surenb@google.com>, <mhocko@suse.com>, 
	<hannes@cmpxchg.org>, <bp@alien8.de>, <tglx@linutronix.de>, 
	<david@redhat.com>
Cc: <ast@kernel.org>, <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue May 6, 2025 at 11:25 AM UTC, Kirill A. Shutemov wrote:
> +	/* Bailout, since try_to_accept_memory_one() needs to take a lock */
> +	if (alloc_flags & ALLOC_TRYLOCK)
> +		return false;
> +

Quick lazy question: why don't we just trylock it like we do for the zone
lock?
