Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A225C708
	for <linux-coco@lists.linux.dev>; Wed, 19 Feb 2025 23:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740006225; cv=none; b=P69ghsXaruCuG6fpOwYc+fBb8tenavJsY+8pYA4tuq8gksECduFL8OG57dZkoE+jv86PLX+dXW3xG//4gcv/L2cbn4cH1P7ktBCHCmORycVoxb9OvoUaceL1j6WoeYudlnLCvDMQh5CXcJ4KLWKII4CxX4x5BipGa0OSgO6wta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740006225; c=relaxed/simple;
	bh=vxlKsPB9fA1eRwdZ3+WVJ8oGahvk3txj7pQxG+ivZBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElOJEoM+izZOJS1/JcPabNnICpWjEhmNOidEszyGWrVLZWuOc+VOpB6l8bW5xGXzcPt5infTK5enjl1j1mFrYv5Sc+7f8yt/r9N6Mu/5u03RX6FEr2n/5yEHC9Oz1NTVXoFob2dhVKpxVO+Rk7kRPDhwBoBr2JIJ36kgGPQp+a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M5rCiYij; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M5rCiYij"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-472098e6e75so55551cf.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Feb 2025 15:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740006222; x=1740611022; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ftoSX9xYRr/sVzCgjZPkFj1DBXhNwozrL+YAzY6rdbs=;
        b=M5rCiYijV9vuG84kMUYNbHMld7EkW5/XnU03FIx7W6BMf58es4+BADnVIe9b6Q8854
         doBoyWimckDvEhk88kK5m1/dn/8a0ddnBoBvnQRaL+ZIe906klC44VN3q6KNnjNyij1E
         O5o2d2ooUCujBDfDtS6dOlliVNgnQ+5QZdaXCAhYl6qbzpsyZOSMYUQ57ZqV0jIC6MG0
         9X1k62bCfcygrDSO8RUVSdv3saGipbI9tiOOn+2BJ0Vlpa8ql34gW84dYcdPN595rPad
         euzqROtNWBPaJG4K3yzFL21qrBXgu0mhCoRi4lQPc9xumajiSbUSS2WaJJ9CTXUs1XpY
         QgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740006222; x=1740611022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftoSX9xYRr/sVzCgjZPkFj1DBXhNwozrL+YAzY6rdbs=;
        b=gSSZ+7qThq2nzzvFn3qK7Qk7UKh0LfZotyMHfzL/qs4k5om62Y7UCCvbNGuw9W+OwF
         AHJQft2exGMDEkgt+EfezqfGoOAiDgzNHfBnbVDKGHtuHJLooFWo4szEgGLYs49QEg0B
         9ApNeTevcImabFRAxRdKHxnsVdfNHvtdbABClRIpr7X/POpQ/ZWPzZ0FaXAZQ2lfjh+L
         kWD7YMAYy4O7Z9WoBMF5nGo8wRAYZkA9aCUNci+b7Y4HX5q/+XN/oERz/yadQ4jQzdOJ
         1zXaYFQ05vlL75SeMnaqnYqOg2DAxXtmlfA4v3OK1q+ymq9AYJZ1te2PbQ8tEz9xn7Jl
         5J4g==
X-Forwarded-Encrypted: i=1; AJvYcCWUqTMUTGgywJGsEmHtUmgs7+rvIuElMT+Tv698tWyiZ8ZDsLboQd2Gea1BYzkFmzR8bAT5MQdbdBBb@lists.linux.dev
X-Gm-Message-State: AOJu0YwI9hpOcpv1+gHPmteJvPSWT2TitdUvYHLnlVGMXUOGXfuwhNeM
	FQDGRjpaUdwaY+yDXQqzBV8UQ8lM+a7qyPYDeMSP99tcZLjXyxg/7qzGex0SpmentPSxgbnTM0v
	p9N3c2DDZSu+iKlD+QSe8OGjBp580XcmTbP4E
X-Gm-Gg: ASbGncvxyTAxMglHIvDBbq47kGRiu+yAO+rOWiGcAs2ZtrRIH/MipGSqgMhwrFQd2no
	FrQLoKOt0NjV/OoJJqsBgf1Y6GpnwIyHYwvfhnE/lBm4CqxTBliBm0asvWMVvPHVnK6cJxw==
X-Google-Smtp-Source: AGHT+IEigDi0H23C4tqPHVwUDRe0Z3zfFdcq8Sehbc5Y5JBHSEG2LTHIimwD47MYcRJPZsrNUaJqJEkjtq8JpwbLyeE=
X-Received: by 2002:a05:622a:1387:b0:471:ead2:1171 with SMTP id
 d75a77b69052e-47217136e5cmr382641cf.27.1740006222365; Wed, 19 Feb 2025
 15:03:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241213094930.748-1-yan.y.zhao@intel.com> <xgycziy2o56hnom3oau7sbqed3meoni3razc6njj7ujatldnmm@s7odbl4splbn>
 <Z4T1G4dwzo7qdwSP@MiWiFi-R3L-srv> <87zfjuoj3i.fsf@email.froward.int.ebiederm.org>
 <f38f1b56-a5df-4644-be59-56c70499ed92@intel.com> <fslhdizolr4twqm4ixevzj6ai5l5qg6mxky25jasn3yctsnvt4@hpwphlmfs5cp>
In-Reply-To: <fslhdizolr4twqm4ixevzj6ai5l5qg6mxky25jasn3yctsnvt4@hpwphlmfs5cp>
From: Jianxiong Gao <jxgao@google.com>
Date: Wed, 19 Feb 2025 15:03:30 -0800
X-Gm-Features: AWEUYZkM_ptDo00RlDjH7cwtNoiOgNsG03JspNquMGAj5QLM3hk8OLDGfWTmT7U
Message-ID: <CAMGD6P3r-S-Va-TRvVjZ808on9+-wFJ_VeTpQ+FEN1jBbhmnXw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Accept unaccepted kexec segments' destination addresses
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Baoquan He <bhe@redhat.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, akpm@linux-foundation.org, 
	kexec@lists.infradead.org, Yan Zhao <yan.y.zhao@intel.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org, 
	rick.p.edgecombe@intel.com, security@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > It sounds like you're advocating for the "slow guest boot" option.
> > Kirill, can you remind us how fast a guest boots to the shell for
> > modestly-sized (say 256GB) memory with "accept_memory=eager" versus
> > "accept_memory=lazy"? IIRC, it was a pretty remarkable difference.
>
> I only have 128GB machine readily available and posted some number on
> other thread[1]:
>
>   On single vCPU it takes about a minute to accept 90GiB of memory.
>
>   It improves a bit with number of vCPUs. It is 40 seconds with 4 vCPU, but
>   it doesn't scale past that in my setup.
>
We have seen similar boot performance improvements on our larger shapes
of VMs. Both lazy accept and kexec with TDX are important features for us.


--
Jianxiong Gao
