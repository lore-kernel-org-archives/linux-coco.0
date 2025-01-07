Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675341F4714
	for <linux-coco@lists.linux.dev>; Tue,  7 Jan 2025 16:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267216; cv=none; b=nB2cvfjzamaVtUoVlsO5yKzWzSBpbACXQjjHiRBacTdpeUb00CzBgr5ir0sdDn9ztez4i0mSl+VgblUwiqoxF+5NPccEgs6BvomVmxkKaLFbe2xLhKW71k6vDC/zOqrFKr4pED43rgbzWKwaZptlUgZkMfDKN9zZmeusQh2HAhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267216; c=relaxed/simple;
	bh=584YggZEBrEwqKseRnYwshnZC98+bV9yZ1UQFQFqEls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQbvhS39gwnetdjRJh/mTTcx3U3AzDifrPwuipvnTHgPp1jzrWXR61KR+6DJU8wg9hbKZ1X3xLI1sbP+CUIe1aTwXPapIdl0Vy8Hgf+TkGkIu4fUci/OrbJq6t4cRRqKEFsVem+E2HGEmaD6UnYxyl1gkExXeACDVnfSGYguyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gjtcRt42; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gjtcRt42"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa67ac42819so2277698366b.0
        for <linux-coco@lists.linux.dev>; Tue, 07 Jan 2025 08:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736267212; x=1736872012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPDb87+wHT7alrKNNz5U85die5MPoJIDxj7r/wzwoMM=;
        b=gjtcRt42qOG1XGOKPVKDavw+t6AHrPK54yVhbpPOn3cctK0Hqc3iJLXYGyAPNjilpb
         F/QHu4ppUaPjL6PK1dfaB9GGN83fI4aH9I9p00eUp3Ndn12A69QUMq9XJ7rL46rcx9o6
         pnnRl9KKRCQwTs5NwyC5wdy5ajdme1nVltqKIK3I7ieImseeShBHQOD/cY4HXbDwrwCr
         EcYEZOPXIOkFu0YbVMa//fZpOC0ksCyhY5Q3Pwfmid1mQiblz+IDOYHl1dIQhygmAGoq
         x/TlrtJsh+RDAZGhDguRbDj+G05xVPH6leh2bIqtRDJPeP8HgkvE8dRxqV7hKf6ZNdJN
         0sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736267212; x=1736872012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPDb87+wHT7alrKNNz5U85die5MPoJIDxj7r/wzwoMM=;
        b=D00YyuIpbh+H7EjSVFLbBM/mOHkt3+YB6McGLDv/GgQSLRkQ9VXq34Lk53OjgUPDXA
         7LxvaC3fga/kTz3A5kjP6v4zo+jnR3nJgi0T62yruhDxTl0jDd+zn4ipX9kyxPEFLTvc
         eBqHEuTKeBQBp09E4JEZXGJpDceVQutMpLVxSwMkzUgpb9mRU9W3SRijku1Ajt9PKsQ1
         7svdgiUFwIP65P4HMWAglh2X9zOFTkVsSDn2aEyJma3xBdetvLkcpjQKugh+1p/SpFVs
         uRc7A+UVHnMBBOKb/2+tvBxpWyJtceSqDWx9YxJ7Zzko4h/R13mOUmFZzEzNnLATNCsd
         GJeA==
X-Forwarded-Encrypted: i=1; AJvYcCU9shrXEtokFnBotwGgGv5bDb1oDqJvJTP6zQFAS6A5+I+/Q4Tg8A0fhS70D2a7C5bi6LiE6zDCk683@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp2hoEIuATLsKpSQ2Ch6OaQebPQwK544M/QjNKikqL5nfSl9zD
	AEVCvj2xqYn07aJ6yptVmw+qxbRYzduyAVQ/cxMcZbXCOw2+lJ5p2AaeC1q8Tv0+R6ySTn59tQi
	1uvo501vHKX4eoqaRmmRVGdJAl/9y04pZVn6KmgN0V13T5u/U0w==
X-Gm-Gg: ASbGncuxzCpA7Lu90bBpN7k1eaEN2OXxZtVVULc4IEYRdazBKz2M3uUFmj+oze/2cMC
	fHz27DcI2xp0H5bCoBy5C4Cu3Nqu5Vra455Za6Q==
X-Google-Smtp-Source: AGHT+IGsKA2BCSM+Ayl+lkylFJpqvs5FuN6F6WuONPmojzLAB0aP379bHMJ7iHbjwy0wQpVe5G06uCEvL1BGTmyfOiM=
X-Received: by 2002:a17:907:2d27:b0:aa6:7470:8efe with SMTP id
 a640c23a62f3a-aac2ad94a1amr5518922666b.13.1736267211482; Tue, 07 Jan 2025
 08:26:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z31OYDtmN3DRe3oN@8bytes.org>
In-Reply-To: <Z31OYDtmN3DRe3oN@8bytes.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 7 Jan 2025 08:26:40 -0800
X-Gm-Features: AbW1kvbzHLO1OdWSt1Sfo_MPHhPBSeql2v_WyqAlp7SboP30th_h0m_b6Bl3A60
Message-ID: <CAAH4kHb21i+CbknQyYjycu2vracmJENkxS8-=VMCmOoNgA0p=A@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Development Call January 8th, 2025
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 7:55=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.or=
g> wrote:
>
> Hi,
>
> Happy new year everyone!
>
> Here is the usual call for agenda items for the first SVSM development
> call in 2025.  Please send me any agenda items you have in mind or raise
> them in the meeting.
>
> I have one item on the agenda so far:
>
>         * IGVM support for QEMU.

Regarding this, I'd like to make sure we cover the topic of MSFT
donating the IGVM spec and implementation to the CCC for appropriate
open governance. We're institutionally blocked without a significant
approval chain to provide code to competitor companies.
Keeping the tools Coconut-SVSM and Qemu uses under Microsoft is an
inversion of power, even with the MIT license.

>
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The meeting will be recorded and the recording eventually published.
>
> See you all there.
>
> Regards,
>
>         J=C3=B6rg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
