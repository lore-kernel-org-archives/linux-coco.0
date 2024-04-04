Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB141D554
	for <linux-coco@lists.linux.dev>; Thu,  4 Apr 2024 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712246653; cv=none; b=UckRwbegwO4C47/oGwd84IQ5jGnGxCSxo+rUnTr5ZVXbaUdAcGBKnUTyTx8FTJQWyuAO9oCnT03At7yMwjDbegb6umVdT+K9IU7wQ7yvkW2uEiMR7laLSrOmzJeXuLhtQwqURRyAzMboN2G+gaad+woDMSpbnmrRN/jakvx0x5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712246653; c=relaxed/simple;
	bh=AYKWp+p64k+3RQGIf/6q/yPwgymf6ydLwHfuSidhdYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhL54ID1o+0xo4C4dNNASqbwWsFfmcWkyultcnQWN4BUJAo2ZFyfJ9Ef/jHhIruBM5H/ql/CFP8sjrS9IDeAg4omHD+EirVz+KDosSYBvf89adLt37TcIV5GsVJWHM1FuK8zjp7TiZPrs8godMhr4TcVm8qRtC8cKAqDzEhG3mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O5rtdcsh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O5rtdcsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712246651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvQMa3e6aa+6chnorpY7KHYDJwijcL8jvc2jYGypk/c=;
	b=O5rtdcshnrtpKXg7g+Quew7dKXWy6Llad//gFAGbDgbSTcSCtgPpHBtmHeFqehfD9F8wlg
	UtXaUwoscRI2eEymQeIGr9rhoS13xCI9mpHEFx46+sSe4vF4bQ0DeCWtG0pTmlWjpWFibY
	xSxR0qelbeoawPTbc/PT4qgBWMWJmWw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-kSMaDqoeOZaDmYxAmefIdg-1; Thu, 04 Apr 2024 12:04:09 -0400
X-MC-Unique: kSMaDqoeOZaDmYxAmefIdg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4155db7b58cso5765285e9.1
        for <linux-coco@lists.linux.dev>; Thu, 04 Apr 2024 09:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712246648; x=1712851448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvQMa3e6aa+6chnorpY7KHYDJwijcL8jvc2jYGypk/c=;
        b=DOBhTi2o++cRhAwjFHbZgVJS7QT5P2MRVW3JePU5p3EUShDzcIUmZC0ZVrXzGp+2Cc
         3nehAcoPrnB7BK+BBb357xhZWkXkv8Y5Irzh7alGBy55au9pYt7jZ9fKT55201CvIOO1
         MhgZ/0P3LTQAhxOhx7xVyqCSo5V+1c31+W6WcRoaP4/puMA8cfqbJjmyznhR6IINiEDP
         FuChbain2xmxwcocAATzeboPcOPxXlQnXHj6DiHtpuOK0LXJzQkgybG+bexFX2KgkD+S
         KR4eo03UNQFpP3leQNNOuj3j4wDt8qbpqrJeThg+3j+TgIRUJbNvocilMI+4yghuDNP/
         Sh2w==
X-Forwarded-Encrypted: i=1; AJvYcCXnjvP8V2H0wA+psULaRXsnyirS6TGSS5Jc6n6w7awwWgZrv3Ytv8R8zKmUJRt0OVRVqQrV8EFCTAxXfVJDAMWzJKcXDlV9UTuRVQ==
X-Gm-Message-State: AOJu0YzJIUA/XoGFijjpcz4emdTbyRSniTv1J6FxRyccPOJ26GE6sAsN
	5HyfKYl97+owoo4Y9Iox03UZdMDtNf/911AxyHn/1HUXWZYM/4G4KD6md4XX8LYFlrTxae3Yphq
	vRUYcSHruqlAndH8ss/t5phJmjjf2BMhjPR6azAFNfI/o4RhegpQfENomKv5Ml7nXrDsKwHAauc
	MOvQi5qtH7oa/N2ujrvYGF8t2u02uer7UMeQ==
X-Received: by 2002:adf:fe0a:0:b0:343:b0b8:d68f with SMTP id n10-20020adffe0a000000b00343b0b8d68fmr18347wrr.25.1712246648583;
        Thu, 04 Apr 2024 09:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9lMpRrvRHs7aq9HiR8B7m2xP5O9kx9uCjd68Psn0mas4tU/87cr01m6gWW8MfdNwKQqtC9KSc5JGf2m+NNJ0=
X-Received: by 2002:adf:fe0a:0:b0:343:b0b8:d68f with SMTP id
 n10-20020adffe0a000000b00343b0b8d68fmr18315wrr.25.1712246648224; Thu, 04 Apr
 2024 09:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329225835.400662-1-michael.roth@amd.com> <20240329225835.400662-12-michael.roth@amd.com>
In-Reply-To: <20240329225835.400662-12-michael.roth@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 4 Apr 2024 18:03:56 +0200
Message-ID: <CABgObfaGNsAva0t0_gm8m0QANaOU7d-EeHvcShJSpCozoJwDnw@mail.gmail.com>
Subject: Re: [PATCH v12 11/29] KVM: SEV: Add KVM_SEV_SNP_LAUNCH_UPDATE command
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, seanjc@google.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2024 at 12:00=E2=80=AFAM Michael Roth <michael.roth@amd.com=
> wrote:

> +static int snp_page_reclaim(u64 pfn)
> +{
> +       struct sev_data_snp_page_reclaim data =3D {0};
> +       int err, rc;
> +
> +       data.paddr =3D __sme_set(pfn << PAGE_SHIFT);
> +       rc =3D sev_do_cmd(SEV_CMD_SNP_PAGE_RECLAIM, &data, &err);
> +       if (WARN_ON_ONCE(rc)) {
> +               /*
> +                * This shouldn't happen under normal circumstances, but =
if the
> +                * reclaim failed, then the page is no longer safe to use=
.
> +                */
> +               snp_leak_pages(pfn, 1);
> +       }
> +
> +       return rc;
> +}
> +
> +static int host_rmp_make_shared(u64 pfn, enum pg_level level, bool leak)
> +{
> +       int rc;
> +
> +       rc =3D rmp_make_shared(pfn, level);
> +       if (rc && leak)
> +               snp_leak_pages(pfn, page_level_size(level) >> PAGE_SHIFT)=
;

leak is always true, so I think you can remove the argument.

Paolo

