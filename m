Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0787E8
	for <linux-coco@lists.linux.dev>; Mon,  3 Jun 2024 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717433087; cv=none; b=EqErg0xsxtsMMT3fm+rtzFPmbV8yBGDgHtSPjTk6VBMyiqONMNy8MnsBEO22FSq6dcYobTL+1pJaIMdnyu425thuG3ax36038fvl/lxC5ELoeEBk5K72DWPOglLrEeDpGxE2xcpnQOkeETeCGjoEJT6cN9fP7iw09n6ZjDQntsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717433087; c=relaxed/simple;
	bh=t4eoPsxvhm/UX72ypmID6dj2keloK0/DxVJPrFRAldI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqJgL3XRz/3omtoje6ih3vDOQNgGb7ju/Mi8ROsXTGwxehaSgNR5c3Pq7t5WcX2qGRD80IPp8qZXLH/ao9TmY5Qcv4KsaA+dzPcTn0+QNqAyocpS0xUwiOdv52b3ABFGxqjwynNYpTj9CoyDSgeVf41ELZhKBZmrxDFBjtMAqRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GYNPW4aq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GYNPW4aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717433084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkJhM79a8R11avJivbxxdE1EejxLWPTC2S55x7A+4us=;
	b=GYNPW4aqLpFo/iAc20n/bks/7poqRsi9zFi0DUTjPSGxpuEy3/VaFgRbVg7TGpMZglHGMb
	WEBkH8Zz1lH36sDac0TGOzyqkgpe/HhjBsaeiOZ0Mtowao3eRzr0AhakL38LvpEzDm1yg5
	XQZn7eKTACw5XP2UwqmQR9FFFKAzStw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-eikmY5w4Pe-HhQm8zuTQZw-1; Mon, 03 Jun 2024 12:44:43 -0400
X-MC-Unique: eikmY5w4Pe-HhQm8zuTQZw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4212e3418b1so19022805e9.0
        for <linux-coco@lists.linux.dev>; Mon, 03 Jun 2024 09:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717433081; x=1718037881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkJhM79a8R11avJivbxxdE1EejxLWPTC2S55x7A+4us=;
        b=HcpaMxjfc+1FV5X3Bs8ZXF53e0Mvs2taImNUACAk9ocroH3syZlKhY5Y3QcGPEHNLm
         eC8XsraNtwAH3IPdZCjUr1RzVYfG0uvTwUKRUWMoXqPV915JI8n9I4rjkrra6maTYO1A
         vgrCZO+bgCgH3pdXOPaLf3u/QsfjV6FI0/xC2W5GXYR4sqg3OXwhmjZxVZ4DXJnpOqop
         xi81rC5TWyKeSQKDTIiyK6eRSP8TR/ts3fg4W5KDmcVTlUzFKhUQn4p77XcuHMguBLTT
         iWfRL8GMACyMAUDxTEqm0GD+AgQPf15Nms9EM8Qda240h9OD/DJD/tRigJJZ7CNrQ3Zm
         pViA==
X-Forwarded-Encrypted: i=1; AJvYcCW7sz3IdmZ2BzA1bKrSaH6BfFj4z836K/V8PuccMSDDBseaYba6nTPQRRNYQDf/TvI5l8QCmHplQRo5kBaVwYTH6Ow9JOcyOcK7gA==
X-Gm-Message-State: AOJu0YyOSZcNq4XkXY7ivcoMHcDeov4EgnKq+lgoR3DhPX3f6Akv9ByY
	5n2QncDGuZ9LfC2o07sGbyMiIQ/QU8d2aL9hEnDWrypy1uJVwioSswPlzRbfEyZWNG8VW0Vh49Y
	NQL+SimSEBcqdJ0MyrcpvVKY/RAFu0YztpIycdUfMnnb6TO091qz7X0aovcL8c5euhxNiro9maw
	oKKt4MS1raelWl6iFsvT17YeKZOW+Za/ySmA==
X-Received: by 2002:a05:600c:4744:b0:420:2983:2229 with SMTP id 5b1f17b1804b1-4212e07530emr82210815e9.22.1717433081485;
        Mon, 03 Jun 2024 09:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMCnI5M+sIjdtgeYl/SuU7qEpdctfImP4SJ6aepSaIJ9r0QcVVw+D6lCCYSXtw8KRc+Y06WU8alk5VEuqo8TA=
X-Received: by 2002:a05:600c:4744:b0:420:2983:2229 with SMTP id
 5b1f17b1804b1-4212e07530emr82210525e9.22.1717433081090; Mon, 03 Jun 2024
 09:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240510211024.556136-1-michael.roth@amd.com> <6nby33glecw46wrdws7vuokrqz4b72evrzdujcrsm6pujo62b6@xoxstkzsvwrj>
In-Reply-To: <6nby33glecw46wrdws7vuokrqz4b72evrzdujcrsm6pujo62b6@xoxstkzsvwrj>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 3 Jun 2024 18:44:29 +0200
Message-ID: <CABgObfbT_v23LbP7Mp-PfbnakHYrZ7+g3KfUA_BOnsp+7ivMYQ@mail.gmail.com>
Subject: Re: [PULL 00/19] KVM: Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev, jroedel@suse.de, 
	thomas.lendacky@amd.com, vkuznets@redhat.com, pgonda@google.com, 
	rientjes@google.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	alpergun@google.com, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, papaluri@amd.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 5:23=E2=80=AFAM Michael Roth <michael.roth@amd.com>=
 wrote:
> As discussed during the PUCK call, here is a branch with fixup patches
> that incorporate the additional review/testing that came in after these
> patches were merged into kvm/next:
>
>   https://github.com/mdroth/linux/commits/kvm-next-snp-fixes4/
>
> They are intended to be squashed in but can also be applied on top if
> that's preferable (but in that case the first 2 patches need to be
> squashed together to maintain build bisectability):

Yes, I'd rather not rebase kvm/next again so I applied them on top.
None of the issues are so egregiously bad.

Paolo

