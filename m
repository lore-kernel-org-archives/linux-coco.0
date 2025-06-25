Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85721773D
	for <linux-coco@lists.linux.dev>; Wed, 25 Jun 2025 08:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840749; cv=none; b=YMfIEhjFtsJirna4lWCVKEYLQ43KzE8nTDRDn4dZWU6EEUZzLXkWEp1ZPJAHPK5Hse7i5f4v93L9eCs3R9O7Bwd2K/YDTedQ4+6W8FfRrWF+7e8fqKN5mz7EsDMnCcIQ2IpayUAr2b8vJMU4m/xz42mqMYm/dibrX65gGadgnQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840749; c=relaxed/simple;
	bh=KuD87kni39T4Q15khepF1+0CCOmy2VLCmuYN7QXTji8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SoSNNQro57tj3cNwl/okdBvlBt975MTz7lBeig+a7OzAF8pbQ7Qe7FlIbjyYuPLAeEh04wfrwBt/AmjtkQ5xHjaB3+8JGda7S3HKqzcBRig1yKYxpbMOM3rZk2wM/IFZiV2ehXHKQk796DwRkbNjzoILXiTF20qsCra/NqZmPR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UB1bpsAB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UB1bpsAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750840746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/lCo9Tgc8LWaap/PwCl7v+i/ersbOq3La8a24mLXXbM=;
	b=UB1bpsABt0R5G8QF7SruZ6WmWxb05yUHnoHXgInlfUpM+grSTNrS4yuBT3lBeN5QDvmQdr
	8SVJUfw17yW73tI9Ief00Tc+fmixU6TFvxrGBVMh07hW2Nns2ncnX3zp4Ys7iaqR4jkk4H
	M4z3LC3QJaXdaWc6qpVLmy57iUjbVzs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-eaMJA5ykMKq8xbcpZNkLLQ-1; Wed,
 25 Jun 2025 04:39:03 -0400
X-MC-Unique: eaMJA5ykMKq8xbcpZNkLLQ-1
X-Mimecast-MFC-AGG-ID: eaMJA5ykMKq8xbcpZNkLLQ_1750840741
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35740180120D;
	Wed, 25 Jun 2025 08:39:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.244])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96FAD195608D;
	Wed, 25 Jun 2025 08:39:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 56203180039F; Wed, 25 Jun 2025 10:38:58 +0200 (CEST)
Date: Wed, 25 Jun 2025 10:38:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Ani Sinha <anisinha@redhat.com>, Alexander Graf <graf@amazon.com>, 
	Dan Middleton <dan.middleton@linux.intel.com>, Steve Rutherford <srutherford@google.com>, 
	linux-coco@lists.linux.dev, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Jon Lange <jlange@microsoft.com>, 
	"cho@microsoft.com" <cho@microsoft.com>, James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
Message-ID: <5rk7iawh4zdcjurmq4gb5brpqvfg3uxargdmlgyhfjj2ucjnsp@jokej4fxi2a3>
References: <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com>
 <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
 <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com>
 <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
 <95a3e3ca-4fba-411c-b979-4dc8ecc1f902@amazon.com>
 <64D33153-BCA6-4971-97A7-110504B4AAA3@redhat.com>
 <CAAH4kHZUMP6it5jwnNv6XdC9NFzj3qAi1DmCTmajTDTYm1NYZA@mail.gmail.com>
 <loxvc232xwxgndtgyh6rp4rw3uumvuvtwrlvcatrj63tsyhlrz@bp7bjcqrywwn>
 <CAAH4kHaO6ig_UQ8m7isiHrQ9rz7dahk6zezCdOJZMUmHjKuGAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAH4kHaO6ig_UQ8m7isiHrQ9rz7dahk6zezCdOJZMUmHjKuGAA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ewXntRIguED0_eeagsNf29YSDaICRavrF7hRBXbavMM_1750840741
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> >      So the vmfwupdate device would
> >      effectively become an implementation detail for (probably) qemu and
> >      aws, and GCE + Azure can choose to do something else instead, for
> >      example store the igvm on some standard location on guest disk
> >      where their hypervisor can find it.
> 
> If the protocol implementation writes to the volume as part of its
> implementation, the location doesn't need to be standard, right?

Correct.

> Certainly I would prefer the location be standard so that any update
> to the location outside of the EFI protocol has the same behavior on
> all platforms,

Yes, I agree it makes sense to standardize the location too.

I think this is something for google and azure to sort out, you know
your hypervisor implementations best and know what is possible and/or
desirable in terms of the VMM accessing guest storage.

The GPT partition idea looks sensible to me, except that I would make
the size field 64bit.

> >  (b) Caching.  Allow the hypervisor to cache the initial state for the
> >      second launch, so going through the whole process is needed only
> >      after firmware and/or kernel updates.  With that added the guest
> >      obviously needs some way to invalidate the cache.
> 
> I imagine you mean device state and just swap out the VM context.

I mean the igvm the first stage has passed to the hypervisor.

The hypervisor can choose to cache and reuse that igvm to skip the first
stage as long as the igvm is considered valid.

> I thought that was already the plan.

Well, when storing the second stage igvm on the guest disk the caching
comes (almost) for free, so yes, that is a natural consideration.

For the vmfwupdate case caching is a bit more complicated.

take care,
  Gerd

