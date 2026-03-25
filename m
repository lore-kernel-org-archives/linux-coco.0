Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280EF3B19D8
	for <linux-coco@lists.linux.dev>; Wed, 25 Mar 2026 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434619; cv=none; b=OGi98Cx9pB5zF0iKQ2IRQFGwlKSWmY/ci5FRHhaQu4dC85RClOTB4okPhF93DwHA8i47qn5EsvANWkNOqCWM/kJuxz03WCBpbVKQ+SsrB/nXeoYaiMb0ngRzeko8Rj507g04jb0VaXhSnF6YghSIOlmuqn8COMz2JGvTGHeY/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434619; c=relaxed/simple;
	bh=/K5iqj5J8A8j5wcmdQiIufBmU70hAoQ2waLIeUNzh0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c50xqtY6Rm9yFDiB3seo5iixrtrN80lthD3c+s3rW53kbDgvLP/PLiy3ZJdxBl8ZGS3sJ5NN+apcG6wDBWZ/2a4Q9u+BoxDAcDqTGzOCAX6EVYfbgjeaxaY1Eb8oOq+8U6BPffF0cM61bZbcUjOrozruHtT/azW4OrKZsXr8gR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eqjNFPLW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eqjNFPLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774434615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/K5iqj5J8A8j5wcmdQiIufBmU70hAoQ2waLIeUNzh0k=;
	b=eqjNFPLWS0HYxFbzO0VWUvpY75mTuVyWC6tREgqf1FId/LbahR1Iz22dbGabEynRi1bXE7
	sb6Vp30ZYLQ5aXx9ffdh8WvK70FC682VtYACT24qiGW2YKoQcQy9PHRRYyyBUq13FrkwRt
	zS/ihXZx0x7EKiELn+rTlEZt/B7vD1U=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-vzLBRLAROkWpiPiCl6Xd4Q-1; Wed, 25 Mar 2026 06:30:14 -0400
X-MC-Unique: vzLBRLAROkWpiPiCl6Xd4Q-1
X-Mimecast-MFC-AGG-ID: vzLBRLAROkWpiPiCl6Xd4Q_1774434613
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so5930909a91.0
        for <linux-coco@lists.linux.dev>; Wed, 25 Mar 2026 03:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774434613; x=1775039413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/K5iqj5J8A8j5wcmdQiIufBmU70hAoQ2waLIeUNzh0k=;
        b=NP0K8JkVX6a1W+F5tIOLaF0huScXArSx9V/Qkaw8VQleZgk14GhULvroVjpbhl6xfO
         rIBLpnZAym+LqJ223Cy+vzTTVps8fussVAy4ymMakq9wz+GCE3rR74FYtG8W2w5otzmX
         kR0ngaNL17WzfokVsGHL3XuRMbJg9cp+NogNib0eCyblGEOL4Bm1HmaPvPei7BwmJtaz
         nhsKa7EsRomemUrtpqJYjkTjYNExfCJIOvL386hplnbEUa/P/8u5SVlviclbOnug7BLz
         E0RM5Qql+qOW4K/w+y3JuWhFVprD5TSgWfDdcRY2i+EiRu1ywjTSSC1a805un94fWsfJ
         eSIA==
X-Forwarded-Encrypted: i=1; AJvYcCU9u/i/HbjzH1vhhVuMG5ImWkbo8desHB+IXqDLpnqmFAl9wD7D1+BhtMwF4WQbwr4fMHvUxRA6SwP5@lists.linux.dev
X-Gm-Message-State: AOJu0YyHvjefJGI3+flqOO74+EkBpx+oxVgf1hvzd8iYbFNLqCSJU6n6
	y/Tv+y61djO3vS8WUz0mPpP9SN3G0+HstIecPXwywU8WLO0zG9eEKsxTSzR+9PRr+NRRHSrxJ9X
	R0kguk4g2IWGorKY+W56uXMu7nNbUSLJMO/WIB2dri8MAMFNteByuIqX0BggZHmVxffTSGw+a6F
	xnhEgRXlHgHrmHIHeqeSsngHGqzhm68Lp+5XLFxA==
X-Gm-Gg: ATEYQzz3yK8sbs2ZMA7NOHUzsxxvuoQFJ5ujgwfsH9D91pFVgmb9Wm6V1zROBnxaD3a
	7qOUjti0LxxuXUHtSRIaUBITrXfLoUe0F2zkZdoxWekPdZGWk9idaXHpxyX1Ey/ObAWCqnmzaTj
	UMEYv+9D6tI+OAbSNp+OrGfQFZM/uo2LhmqYNqlUMIZEJYpG1OUMacVmmxUrA2I8v6/2/SJzjEd
	Fuv74iWf/C9DIQE/YkGZBTvqsACt6vGN0Eg4YfgAiqEGeR/OdkG+PiPDV89FbvJ/0QP6FCUWQmB
	seuycToIcQVlMtOerXK7u1Y=
X-Received: by 2002:a05:6a20:728a:b0:398:7ffe:472f with SMTP id adf61e73a8af0-39c4abb1a20mr3400015637.2.1774434613146;
        Wed, 25 Mar 2026 03:30:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:728a:b0:398:7ffe:472f with SMTP id
 adf61e73a8af0-39c4abb1a20mr3399621637.2.1774434607795; Wed, 25 Mar 2026
 03:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324-tdx-hotplug-fixes-v1-0-8f29f2c17278@redhat.com>
 <20260324-tdx-hotplug-fixes-v1-2-8f29f2c17278@redhat.com> <56190adc345148396ba6b3e52672e662145f7dc7.camel@intel.com>
In-Reply-To: <56190adc345148396ba6b3e52672e662145f7dc7.camel@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 25 Mar 2026 14:29:56 +0400
X-Gm-Features: AaiRm50voWV5PH3kvip0CwHf2r5p2rX7ohXoogSeVkiXyqdnWEryejEwneqFxjo
Message-ID: <CAMxuvaytU-pM+rviUbNGWMhvbAYutwvaSXW_O=sn+QfOzF35Xw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/tdx: Accept hotplugged memory before online
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "kas@kernel.org" <kas@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "Qiang, Chenyi" <chenyi.qiang@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bonzini, Paolo" <pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1IlGxZqQhuYH3pBhLaGcz_5yFhFXbvDJeRdjEUuq-nY_1774434613
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 25, 2026 at 2:04=E2=80=AFAM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Tue, 2026-03-24 at 19:21 +0400, Marc-Andr=C3=A9 Lureau wrote:
> > In TDX guests, hotplugged memory (e.g., via virtio-mem) is never
> > accepted before use. The first access triggers a fatal "SEPT entry in
> > PENDING state" EPT violation and KVM terminates the guest.
> >
> > Fix this by registering a MEM_GOING_ONLINE memory hotplug notifier that
> > calls tdx_accept_memory() for the range being onlined.
> >
> > The notifier returns NOTIFY_BAD on acceptance failure, preventing the
> > memory from going online.
>
> Does this depend on patch 1 somehow?

Yes, if I plug, unplug and plug again I get this without PATCH 1:
[root@rhel10-server ~]# [ 5707.392231] virtio_mem virtio5: plugged
size: 0x80000000
[ 5707.395583] virtio_mem virtio5: requested size: 0x0

[root@rhel10-server ~]# [ 5714.648501] virtio_mem virtio5: plugged
size: 0x2e00000
[ 5714.651808] virtio_mem virtio5: requested size: 0x80000000
[ 5714.676296] tdx: Failed to accept memory [0x108000000, 0x110000000)
[ 5714.683980] tdx: Failed to accept memory [0x110000000, 0x118000000)
[ 5714.686997] tdx: Failed to accept memory [0x140000000, 0x148000000)
[ 5714.689989] tdx: Failed to accept memory [0x128000000, 0x130000000)
[ 5714.694981] tdx: Failed to accept memory [0x148000000, 0x150000000)
[ 5714.704064] tdx: Failed to accept memory [0x138000000, 0x140000000)
[ 5714.710144] tdx: Failed to accept memory [0x118000000, 0x120000000)
[ 5714.722532] tdx: Failed to accept memory [0x130000000, 0x138000000)

My understanding is that QEMU should eventually unplug the memory and
PUNCH_HOLE then KVM should TDH.MEM.PAGE.REMOVE, but that doesn't seem
to happen. Is this strictly required? According to the specification,
it may not be.

