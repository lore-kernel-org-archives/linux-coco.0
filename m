Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4A258CD8
	for <linux-coco@lists.linux.dev>; Wed, 10 Sep 2025 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524737; cv=none; b=eQwhj8TkY5zOrRzLigfaQ3nOIIuMXpCixZfftS3GH9eI7wYUxLCz6sVmXpFo4hXyCVZ9WOOSMGHU38o5xqDH2eBXt/dZ0p9UN5ajMEjbiLr7c3K78MaBn8aQq460HZR98kDUcgXB362qLaihaGvtEJT3B2Sqdd8d6eSEYuwZMVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524737; c=relaxed/simple;
	bh=8NO5AGg49+T5ajYObkd0y9xDyV0ygdMLFtI81YL8HQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/HZVWlii3rSahn9nO/pkAaygRu1rOtJ48OvW608dwb6ziXgNg6sHIAec54+JlBllkeBuSBoqzPD0rqWtaSGCdnX+GCuc00v8V2agrEefV0Oot7vCbAXu0thPtaJk9FwBSlzX3eov0BReUuoDr7fh4NfKIUWi0NN9L6iVxmf8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=opYPZrLZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="opYPZrLZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24cf5bcfb60so10675ad.0
        for <linux-coco@lists.linux.dev>; Wed, 10 Sep 2025 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757524734; x=1758129534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NO5AGg49+T5ajYObkd0y9xDyV0ygdMLFtI81YL8HQI=;
        b=opYPZrLZSvuUiib/oO1syJgn2ypprUWiRx0dvZpGQ/4EwAJFpQA1A+gEV2Me0mU1bO
         2GJU3J/z1k9/mb7zaFOMh5mH1qmTvXWogofEP4BaYPMsoQwlZU8tXEQU42Fk5Khgsk4r
         G9MQTpH9dD7Pa7zkgvEoh2x/+ptw8symw1cj3qFLX5xlWLFcnbgffb05pMrt+buXWyFl
         W0gFaT0CShwEkZPO1Ziq6tAzsOXdGatE9lJ0xzjBfiMOviCnhmSE3mYMV2Miu7H2iH9/
         MHY38JU3JDhZpgVLaQLjFERUjnJcQ1YlLNE1XHu9BPpj9ABKDCJTboarRvpWEKncNHJf
         2NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757524734; x=1758129534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NO5AGg49+T5ajYObkd0y9xDyV0ygdMLFtI81YL8HQI=;
        b=sXrn+XFyOOj/8UWM99Eg3fZZqKZ05pFrxa4q+GRtJxBl7LkgvbVjNZnEGgcEowsmzr
         D4Fan+R01CL3oKo6Ie1QHhMke9YIkVEShI4lAb/FmroPd51JLXZ1tD7GGmgK3AJH2Iyi
         bT8HWza8nIxK+ELQ3LzvTUbLh1603tATYY8pWWkiudlhLoQG1r5a1jmx3mVpmp7TbIsh
         /oV1D+q4q9sHBTdsrfqBmhTzu7EE3EOivTaT0wfKvzJBS1Vdn9j8oVdSEknVvTgr2GSs
         EUHWlfahZyWfQJbTiFaBVdS/CHuov3z7GAp9MwgrLpeY1JQ3z+tSaILOHcygXMppm+TW
         NeXw==
X-Forwarded-Encrypted: i=1; AJvYcCXbjxILJb8SLn43+b3ZsoeaFg999uaIX0UmdcVNDOFWMTrszKjb1S25nwO+Ado7/IN0hvWfE/QW62Pv@lists.linux.dev
X-Gm-Message-State: AOJu0YzKe9jodvmhtHWiipmyqsn9CrTHrPEoay0evEMQMLJGEBULuh2s
	lTVemMkqtEt39BTJMM9SumWNPvojr2IhTICqGyPSuMLWRG5GpEVEXa7dQk/0Q5uOQZdlnkY5YBw
	apuut+e6T8nsq2asy7BnSk1LTa9OMqBrwAlKn+Qzb
X-Gm-Gg: ASbGnctpge9Bemiy+jFzp/ObdYbt2xZu84OqU//ru/0qPETWact1OELujehoeYvdCl8
	SVDZCf4lTxlosYafPihf4BK8ZjRaHlv2SylcgabDKhh6Y3jO5fbPHwEdkUr4vYell6I4HVwyDW+
	vHHQoFTi2QY+e62rlI8s5XU+y2NHMhYqUnRdpQ3nBQw5pUgFaAAJVF52OqC2TkDw37mbspUUqjG
	EwjRaQwRAeyxZfbbRFI1Z/hqJWUItE38uyTtYeCz206TQJx2srkiUU=
X-Google-Smtp-Source: AGHT+IHCUkd4DH5Y6JVUzen1aiRKVsuVwVddE1fVh3QxgdLia5R9VcHQ0lxR8oXmVv5fSqX3gWLykbYPG5i7ULXFWuU=
X-Received: by 2002:a17:903:32c8:b0:24c:1a94:e603 with SMTP id
 d9443c01a7336-25a7d6a471emr4327895ad.1.1757524733490; Wed, 10 Sep 2025
 10:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <2537ad07-6e49-401b-9ffa-63a07740db4a@intel.com> <p5tqgxmmwnw2ie6ea2q7b2v7ivbsebyjpucm6csrvl2eghuzw5@bods3pzhyslj>
 <4be5db34-aadb-49e3-9a94-49d39c8bd31d@intel.com>
In-Reply-To: <4be5db34-aadb-49e3-9a94-49d39c8bd31d@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 10 Sep 2025 10:18:40 -0700
X-Gm-Features: Ac12FXwizQV2e3Qmj9lOxxFpjbgzFrxvQifAmyKv0lv5qG3kU9tlMxyMvEl_A1w
Message-ID: <CAGtprH-MnG6sxjbWZBLMM83j6mohzRvc-shv3XCJOjJWqwQzXQ@mail.gmail.com>
Subject: Re: [PATCHv2 00/12] TDX: Enable Dynamic PAMT
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, pbonzini@redhat.com, seanjc@google.com, 
	dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, 
	isaku.yamahata@intel.com, kai.huang@intel.com, yan.y.zhao@intel.com, 
	chao.gao@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 8:24=E2=80=AFAM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> On 9/9/25 04:16, Kiryl Shutsemau wrote:
>
> > And it is going to be very wasteful. With huge pages, in most cases, yo=
u
> > only need dynamic PAMT for control pages. You will have a lot of memory
> > sitting in stash with zero use.
>
> I think it's going to be hard to convince me without actual data on this
> one.
>

* With 1G page backing and with DPAMT entries created only for 4K EPT mappi=
ngs
- ~5MB of DPAMT memory usage for 704G guest memory size. We expect the
DPAMT memory usage to be in MBs even with 4096G guest memory size.

* With DPAMT entries created for all private memory irrespective of
mapping granularity
- DPAMT memory usage is around ~3GB for 704G guest memory size and
around ~16G for 4096G guest memory size.

For a 4TB guest memory size with 1G page backing, the DPAMT memory usage

> Even then, we're talking about 0.4% of system memory. So how much code
> and complexity are we talking about in order to save a *maximum* of 0.4%
> of system memory?
>
