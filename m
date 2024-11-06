Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA1718C00E
	for <linux-coco@lists.linux.dev>; Wed,  6 Nov 2024 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892009; cv=none; b=FIBgDvhhdsPCdUHCxxvCY6kR6Gf2f4cgDy8Ot6kVXfuAyDZj7S7/i6JfHNtml7cRFShgfsakf2P5nD64z5MwhCkkqWWgL+KC1Oyv4cSbw7PFixODkl17d/0S/VO6Zt9vlh36xSFiqdQrflb0erC27qMBWB51Av3S051MmoSU5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892009; c=relaxed/simple;
	bh=sDev3LO5fhXhE7JBnHp1ZGLZ7yuT4aHUXRGR94pNH24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NVqKRnSJ0SyVZswEW2zf5Qqg/ITw7A7PPLV+pxyTR2il1IErLFVP/czVO1DsWo2EVAETBVDLykHTzuMp43R4Qdeeg0FH9JqvJ3+pgdbD21FYZ6Bbh+G1hBY7fCvzmzj2SinB+SlTdv1gHhOFZq+CcoXCR0L2DzqRayldV0GemEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YmQ+6dFM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YmQ+6dFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730892006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJBjrFIps+dj+nucOlxhqTBpH+3vXXFkH8CzxzjpDlQ=;
	b=YmQ+6dFMeCg6hEvTKQC9f62ayZBIYoHvY86RLD7DFfBljCUk+fZSvIZwiKkbgZebMggxjq
	xljWcG4YtzjTYgNn/DQk9NBQdEbHqHLjJJh/C8cPNPHDs/iS2tBSz/k9NKwjilZSTV7z1m
	5bDgybtsqc0lhh8c0xM208ldnt4tOFc=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-YW6P6vGwMZy7aHSXxmGXSA-1; Wed, 06 Nov 2024 06:20:05 -0500
X-MC-Unique: YW6P6vGwMZy7aHSXxmGXSA-1
X-Mimecast-MFC-AGG-ID: YW6P6vGwMZy7aHSXxmGXSA
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-84fd18bac1fso1965618241.3
        for <linux-coco@lists.linux.dev>; Wed, 06 Nov 2024 03:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892005; x=1731496805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJBjrFIps+dj+nucOlxhqTBpH+3vXXFkH8CzxzjpDlQ=;
        b=kqT9xSprARag8ZSEecscftp9f1PV+KSV9elz0k/enr5m0pfHGGmpe8efDZIE+lAu6R
         J3f1/nIE+23/1n4916zvCOon5uLliKoT4pEIfQNHbhFhcNe4/vmMY1T/zRlnnzL6JuKZ
         16mAe+oP3cq2qiJpd8xRbJHpWMcUVk0aGoWAicWXPOBml43lUvZdhEdW1p80FAfXQbkH
         TcF+uCeT93mbHKKgveUaG+KYw8fJdm226iDYcR0ICbpAMn0BGtAlRasEuSLa/+ZaVGsC
         2CuheBwnHs9XzbCiW7/ysd8P1ScxCZXTUK/Bs+z8XoHXJ9eIOrpSYei25jdBEtkeGMOp
         6f5Q==
X-Gm-Message-State: AOJu0YzoM/mX1XZxRQazHPo0ce9edsplhrQClB1m9ft+4zcPaRfPZAG8
	PAesAcU9y4C2+gYWhY3qtKYF7heqRyq7/++34p0GUXCHDQSmddeDJuwWdzsmbzyCZ3ulIYZ3Sd3
	8ZdAeD6WV1BstYY3n7tNKk1uFVX67GmlUD1kI22XU+e24KJuCrlxq6+Wg70M=
X-Received: by 2002:a05:6102:32cc:b0:4a4:8ef0:25ba with SMTP id ada2fe7eead31-4a8cfd305c2mr40379641137.21.1730892005157;
        Wed, 06 Nov 2024 03:20:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+bflx43lK9gjypOIShSM9cK/ZsP2QNHNK4seVhUNLgz3z1zdg97hz4VeYmjWZLFRDi/NVlw==
X-Received: by 2002:a05:6102:32cc:b0:4a4:8ef0:25ba with SMTP id ada2fe7eead31-4a8cfd305c2mr40379613137.21.1730892004750;
        Wed, 06 Nov 2024 03:20:04 -0800 (PST)
Received: from sgarzare-redhat ([5.77.86.226])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad19b328sm70049421cf.85.2024.11.06.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 03:20:04 -0800 (PST)
Date: Wed, 6 Nov 2024 12:19:52 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-coco@lists.linux.dev, cclaudio@ibm.com, osteffen@redhat.com, 
	jroedel@suse.de, Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [RFC 0/3] Enlightened vTPM support for SVSM on SEV-SNP
Message-ID: <hcttb7s5yvur5oigge2xlbspyi26ngrgc4unn7ewv6px6vgukv@mp2relslhh6w>
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JWl-ioXF92Ayj-zFuXMKWmLb6cn58hUn9RjCjQCNfVk_1730892005
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi James,

On Tue, Jan 03, 2023 at 04:01:33PM -0500, James Bottomley wrote:
>This is a sketch for how a fully enlightened vTPM driver would work.
>The idea is that the SVSM responds on function 8 to vTPM requests, so
>we use that to send down a buffer which is modified on return (the
>buffer must be big enough, so the agreed protocol is it should be a
>page in length, which is larger than any possible TPM command or
>response).  The protocol used is the MSSIM one which is self describing
>in terms of length, so there's no need to transmit sizes (it also
>leaves room for expansion to localities and cancellation, which is
>useful in the light of discussions).  A NULL in place of the buffer is
>a probe and the SVSM call simply returns SVSM_SUCCESS without doing
>anything.  This can be used to probe for vTPM support because any other
>return would indicate no vTPM present.
>
>Hopefully IBM will publish the new svsm-vtpm repo shortly, but we're
>still working with the old CRB based one at the moment, so it may take
>some time.
>
>The three following patches are for two different repos.  Patch 1 will
>apply to any upstream Linux kernel, Patch 2 requires the non-upstream
>sev-snp repo and patch 3 is against the non upstream sev-snp edk repo.

Thanks for this series, I'd like to restart this work and Claudio 
pointed me here.

IIUC the last version we have is the one in Coconut [1] which is based 
on this series, but with some changes on top from Claudio to probe SVSM 
and check if TPM commands are supported or not.

I already rebased them for 6.11 here [2] and we will include them in the 
next coconut-svsm branch, but in the meantime I think nothing is 
blocking us to upstream them, so I can take care of Linux patches, while 
Oliver (in CC) is working on the EDK2 patch.

IIUC the only thing missing from the patches we have in Coconut are the 
fixes to Don's comments. Do you have a branch or patches with them 
already fixed?
Otherwise I can do it on top of the patches we have in Coconut.

Any other things to fix/improve that you can think of?

Let me know if it is okay with you that I will restart working on these 
patches.

Thanks,
Stefano

[1] https://github.com/coconut-svsm/linux/tree/svsm
[2] https://github.com/coconut-svsm/linux/pull/8

