Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3168D101FF
	for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578701; cv=none; b=IUWUmQUkQoi5Fe4vD5XEHGCAbMUXxIDjaJiqVq1xavfYrzOSa/fEoA1BBcZ6T1fdMzPBdr8Y3r0mjXizOSuqlKkOmK0xB0bdPWVm466tchJHZHwvMug9s5EoZBsIdLuNjILTbjye4occQw28J7LW9DA9PGWrq94e6bLjkczZr78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578701; c=relaxed/simple;
	bh=qbP6wLlpmbPqz0PHiYQF1+1p4HKfgztRAQYbO4l6R0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GdkGU8HcvHmHjUJGxObooQlVTUcpAyOMy/4wYGVPVxZFdFzRchiePGgktiAvPBHNh3c4meJJHkudyaPF+1ud5LDgAj0cOn0P4PwzMBp25P8w40wEGOsSV2mckz2727JTkXWTm7sZw7/OBmUjr3tLYH8k0eg2IBjIt/Uo0wx2Es4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U6oE9xSa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U6oE9xSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740578699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MrIvhhlZ2/nr7vA0MkcyqNJwjuNWYtwYOPhy37qyolM=;
	b=U6oE9xSaywAR9VfLAobe7umwvvGvMC/rfZieOGAmEdnRsippit/yR4SEM3jZWVxIW8GOMj
	tIZxCY3SaQUeTw/f9GdsYQkz85pvVBRcjOSejAmj6iSnNS3l4LBflSth1g3tv3X2/+snZz
	InVIe3syuX4uvEVx9ziKqXDpHdffUC0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-UaiOJd1tMkayBA7GXyPzhQ-1; Wed, 26 Feb 2025 09:04:58 -0500
X-MC-Unique: UaiOJd1tMkayBA7GXyPzhQ-1
X-Mimecast-MFC-AGG-ID: UaiOJd1tMkayBA7GXyPzhQ_1740578697
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ab456333aso14479785e9.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 06:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578696; x=1741183496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrIvhhlZ2/nr7vA0MkcyqNJwjuNWYtwYOPhy37qyolM=;
        b=uaF/8NM34YR/kK8qAqNFAzHunsIsKNz2KmBDd2ZkHRewvDs3MisEN6reDaMuGrWPA7
         hWB4YadtftyvkNTi8PGcv2CgEOkQa+sPszJBWZBtVgTxPEecekTdOVEonJJF7liihVSR
         8JaH/pZ39Srd+yPHdcwhXuDsHv1UhOebwt62wYkgzLSQ+ekb61lEZCrcDLrXMjerXVda
         o3bSjsHcfqRywtq2oqrny8BpCaiuHWxFcIgtQDiEYy/zBEDQETcHg+1vM/zzczJyESgs
         CEE2k8we4m+d3Kg7p3T7UQnDbyNDSjRxZchHMqza3bFJ6P6ytsFAYKe2oPWsjuu8/PaR
         2XIw==
X-Gm-Message-State: AOJu0YzHJH7Y12PRgLPKM8sDAkiq6OP9+w5OCGBrTQEhM/3OO4uYDcWm
	CiCjVYlWTuQwdTgB10jkRFw0X3ub7u/AHpRYSMCc8ElXyEBOUeecEL26dVhqpcP68S65sDnaGzp
	UzDcqemsDTUClnfooClh8MH3qRXtfeyV5N7hYdb1wsU6uAU8QyFTPB9TfD4vM+DlU+Xg=
X-Gm-Gg: ASbGncvO6aVhlMH2bf+Ztw/Xb8Q0rV8LFkA6ekba9ApXmyWeC8E97QtODd0yogZ82Jt
	vsTt4ODhkUWNEzJA/6C2G0Bg5n2pKNfns52Bhw5dqYVOcj5zXSwkBae9JFIe27UeryY2uai5dUY
	aK629KappUyflxw8qeajsjebDnTLGNkO7KPgznfIr6dsEyj/76SdxiuwRlQfRXOpS8PypVMvhqb
	BfBHQbPJDqVOMGxs87cihg4BFa9WfQSKiQZ9cTYZcFAQLx2ScznrQNFfWKrD5uIPH8VFiaGJaog
	psLVVEXRESvRHzj6
X-Received: by 2002:a05:6000:1f8f:b0:38e:48a6:280b with SMTP id ffacd0b85a97d-390cc631ac9mr7297092f8f.34.1740578696042;
        Wed, 26 Feb 2025 06:04:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXtwDWuF6zPNLtHQlx3+fKfEghfXlFx1wFF7oXElFodXjWsPZ5StSYPlmZnorPjYxkYdvnyg==
X-Received: by 2002:a05:6000:1f8f:b0:38e:48a6:280b with SMTP id ffacd0b85a97d-390cc631ac9mr7296995f8f.34.1740578695337;
        Wed, 26 Feb 2025 06:04:55 -0800 (PST)
Received: from sgarzare-redhat ([5.77.88.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd882a37sm5795628f8f.51.2025.02.26.06.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:04:54 -0800 (PST)
Date: Wed, 26 Feb 2025 15:04:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Subject: Re: [svsm-devel] Using a linux bus for SVSM devices
Message-ID: <CAGxU2F5N7MrLU_Wsr0D1nBS_C=ojjm-NUmf5_a00j6+jiuDtJw@mail.gmail.com>
References: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yo7uuqX9SZMvv_uc4RN4mdTqWK3DN7kzNS6VWciJ2hE_1740578697
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

On Tue, 25 Feb 2025 at 20:27, James Bottomley <James.Bottomley@hansenpartnership.com> wrote:
>
> It looks like I'm not going to make the next SVSM meeting, so here is a
> brain dump on how the linux bus type for virtio works.  Basically it's
> a capsule for matching (and automatically finding driver modules) for
> discovered devices.
>
> The way we should use it is pretty much the same as virtio (see
> drivers/virtio/virtio.c for the bus definitions).  There's also a nice
> series of blog posts which documents this:
>
> https://www.redhat.com/en/blog/virtio-devices-and-drivers-overview-headjack-and-phone
> https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
>
> The only real difference is the configuration signalling, which is done
> over a pluggable configuration interface (which is either mmio, vdpa or
> pci).  The SVSM only signals over the architectural mailbox API as
> defined by the SVSM API Spec, so we don't need to bother with the
> config_ops and can use a simple static C based API instead.
>
> So I would say we copy virtio bus type, pretty much, with the standard
> groups, match/probe/remove and uevent for driver binding and put it
> under the drivers/virt/coco (or we could go with a new
> drivers/virt/svsm).  Next we simply need a defined API for calling into
> the SVSM (so something like the AMD abstraction which hides the calling
> convention) which we define in a header instead of using config_ops.
> The body of the API would vary between architectures, so the
> implementation would likely be in architecture specific code.
>
> The only other question is what we do about device IDs.  I'm strongly
> tempted simply to use strings, but all the other code does use fixed
> length ids, so we could probably follow virtio_device_id except have a
> single u32 for device_id (I've no idea what virtio uses vendor_id for
> since every driver I've looked at leaves it as a wildcard).

Yes, I also never saw the vendor_id populated with anything other than 
VIRTIO_DEV_ANY_ID.

>
> The final thing would be to think about interrupts, but since the TPM
> driver is strictly request/response, we can defer that until we know if
> the observability driver will need them or not.

Thanks for this report!

IIUC the SVSM vTPM driver will be the first one using the new bus.
Since I have the new version almost ready (need to finish writing better 
commit descriptions), do you think I should post it in any case as RFC, 
or better to wait to include also the SVSM bus?

The current version is here [1] but it still uses platform devices, even 
though I removed one as requested during the review of the previous 
version.

If no one is working on the new SVSM bus or planning to (don't want to 
step on anyone's toes), I can try adding something to that branch and 
send an RFC here.

Thanks,
Stefano

[1] https://github.com/stefano-garzarella/linux/commits/vtpm-svsm-upstream/

