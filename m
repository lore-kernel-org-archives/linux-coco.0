Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BED10A18
	for <linux-coco@lists.linux.dev>; Sat,  3 Feb 2024 05:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706937594; cv=none; b=rQNcaUrtVYIzd0sHClCFOuEIybxyDgR+T1zy5K6rexfhE/nhHhksWG6WANovj45znDXL+T2NMntcGPESI8t9J9V7exlb7rPEnUeia93J1pHWMSv/Q+gkI0R+I1kiZwBBNPJ2gJOdVcWeQpq/wcPP6e4xegYDMstMZj35iltV54A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706937594; c=relaxed/simple;
	bh=aV3RAoxJAIIl/L41qxXGSFWaFYi0w5bCiFnptXPK/IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGi4lGlYEaEMhSLNGWuD8ab6JD6GdCZ/qqK7gjBxOBP/qmnMlw2D/whXAJVqjVxL8pZp7aH/dD1NWG5gfbj+tEbi7OHSQk85zfS0yxmz6txo1Cj8G6HC8wARXAfkcRzVWbLSlNyr7F11BAHmM6J+C786Y4WtiODzjJECauDso/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aoPP5Gta; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aoPP5Gta"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-68c814135a9so10382256d6.1
        for <linux-coco@lists.linux.dev>; Fri, 02 Feb 2024 21:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706937592; x=1707542392; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxZUisTRnkCHmoXtIIiIE5AFQkxg9hNXueoX4FT1IyU=;
        b=aoPP5Gta8BfLWm0Qt7dmjXgoxspZEczBfWiSNw4p7nBKPxvsZx2kUMMisAxrZakBT0
         ea480dfiCnBK3pd4JqUSwM69iX29ox5VGGPtvuqS+lhiVqTKmVKB/Vc0VFyktuMH48Lr
         SrGZop3lveKkSmGoDLVH6aQZNUENvOOkI/NWcay7qMvWQgkV9R26p34LOQXDqIqBCFOW
         SnsQ8DRwz+XcmIWkCtdJ3XcaCi4eGck8pXu5x4QhjLDmXK/8LZSP3vOrr9p9MsO9qJmG
         n2Ql1o6ZkNlsIpSSZdSLTJ9d1/Ja0rZwxHoJDZGimE4t3cTl0Y8jRf1yn9cJVNdzN+YH
         F6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706937592; x=1707542392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxZUisTRnkCHmoXtIIiIE5AFQkxg9hNXueoX4FT1IyU=;
        b=r3ExqWPOFBxj3TrLm9/iEUJ7oM5OIHRx4Ts5bueCWlOdtPoEEz1Qnj9nKLzSlqEAxy
         IXCKrIiir+2USLQq9CyGV3JOEozFLSMbtXLipEGg8ZuBa/RN9RO9/w2Lf08iJ3NQgxT9
         0GMFoz2BuAT+wXEU3ULBHwRwVYGkriPPHQ5p6FMEgivKPIGpEvztspEN8LRHv3jS32Ve
         IP0IM33qfsbC70Tj/NthY03brWpUGK2w8pjWch7JdG+ELpyg/Uxbxst1+JMhVhHh0+mv
         fxy0Ke9VGgIYRz0foSOdhmhIvaoJWhn05BxW0ga9wJghyDK7T7FdjTO5N/00iujlU21j
         IJyQ==
X-Gm-Message-State: AOJu0YweY3iqBDUVSlw8fofYr61St1IiVdcjD0RBQzTZNQ5K0qIT7GWh
	Q17zRDk2BhGCBaShBQDXL2Qwoz16fAZcr8VFV+VgPXeiU7G3u9CAzuP70Lxa/GNnM5nj0PojZDd
	HxuExHsINsX/DzSreQkHhtlOii13bGU1C9LFx
X-Google-Smtp-Source: AGHT+IEZAAPF64V9fhwb83mtq8fxx2bw72Ju+9SxlvorBwmV39Npwwn5YZ+MgV2PpJ35mYdpTaZi8VMsqxbbJHCx/cY=
X-Received: by 2002:a0c:aa1a:0:b0:685:edc7:62c0 with SMTP id
 d26-20020a0caa1a000000b00685edc762c0mr285138qvb.30.1706937591794; Fri, 02 Feb
 2024 21:19:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112055251.36101-1-vannapurve@google.com> <20240112055251.36101-6-vannapurve@google.com>
 <6709a57c-48a0-4ddd-b64e-a1e34ae2b763@intel.com> <CAGtprH_ANUVU+Dh1KOq0vpT7BGbCEvD2ab9B=sxjzHYsKxFGeA@mail.gmail.com>
 <1d9d3372-825a-417a-8811-ffa501c83936@linux.microsoft.com>
 <CAGtprH8r0kYYqGoumsVeZq42cX8CN3cchkuRYhQULqtb-1nKww@mail.gmail.com>
 <3313c886-e964-48c3-8277-b47cb1955de9@linux.microsoft.com>
 <CAGtprH9X0Yz_Z+QaYcLpLNXtY_Ye68aqvx-G1pOWZxv9SiRRoQ@mail.gmail.com> <746d2448-3adc-467b-a39c-5585f33bd740@intel.com>
In-Reply-To: <746d2448-3adc-467b-a39c-5585f33bd740@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Sat, 3 Feb 2024 10:49:38 +0530
Message-ID: <CAGtprH8X96enAOmgu60q0N6L=NEB29PBu_0yEuS8u1U=C4VO3g@mail.gmail.com>
Subject: Re: [RFC V1 5/5] x86: CVMs: Ensure that memory conversions happen at
 2M alignment
To: Dave Hansen <dave.hansen@intel.com>
Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, rientjes@google.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, peterx@redhat.com, 
	vkuznets@redhat.com, dmatlack@google.com, pgonda@google.com, 
	michael.roth@amd.com, kirill@shutemov.name, thomas.lendacky@amd.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, andrew.jones@linux.dev, 
	corbet@lwn.net, hch@lst.de, m.szyprowski@samsung.com, rostedt@goodmis.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 10:06=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 2/2/24 08:22, Vishal Annapurve wrote:
> >> If you must - focus on getting swiotlb conversions to happen at the de=
sired
> >> granularity but don't try to force every single conversion to be >4K.
> > If any conversion within a guest happens at 4K granularity, then this
> > will effectively cause non-hugepage aligned EPT/NPT entries. This
> > series is trying to get all private and shared memory regions to be
> > hugepage aligned to address the problem statement.
>
> Yeah, but the series is trying to do that by being awfully myopic at
> this stage and without being _declared_ to be so myopic.
>

Agreed. I was being overly optimistic when I mentioned following in
the cover message:
"** This series leaves out some of the conversion sites which might not
be 2M aligned but should be easy to fix once the approach is finalized. **"

> Take a look at all of the set_memory_decrypted() calls.  How many of
> them even operate on the part of the guest address space rooted in the
> memfd where splits matter?  They're not doing conversions.  They're just
> setting up shared mappings in the page tables of gunk that was never
> private in the first place.

Thinking it over again, yeah the conversions that are happening
outside SWIOTLB should be impacting significantly less memory ranges.
As Jeremi and you are suggesting, it would be a big step forward if
memory conversions happening for just DMA requests are aligned to
hugepage sizes.
