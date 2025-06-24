Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503C296169
	for <linux-coco@lists.linux.dev>; Tue, 24 Jun 2025 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767506; cv=none; b=JXJWfnvVYGlbBKWE8wVrEjYapbDmauo6swjzgCRQ0meCnHQv9D79MOUFQdQRIdRsZKzFftty+8iKOKUqYAa3o8nYyV4Hi+imKkUXNA/OClKHfZPxlo8oohQWDbo0cdEzTlkZ9mrqBltMqaxKbrsJRykX6bl8xDzHbGGxEc+5y98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767506; c=relaxed/simple;
	bh=L46OJGinAIlWeuYC6f+IJQzorzVrnvjRnuolAbg7H6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ha3jf7dTxkEi8ioPH36H8OeKPBQrs8gR8b3C3/Q0E2lO6mHTCIFcVDX4UXCGHsiEiEZv/fnXVDLkxlB6Hr2ORAT7ZWuzV+dNX069/7lS4n/Z5A1nhuiI8e75aSVMj7FKNgv/At0bHeDKamlYb8wS/teySmen4gVbO24SMHePpZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJeR372k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJeR372k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750767503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=76kc6iyi1c14KpaGcTny+I4vXrVSsoSl0PBhsnhIk60=;
	b=YJeR372ku6yuIFA8ctKnKtnu0H+l0AkIS4nuRxAhcvshPQlRLUPbR6hZRkDuN/ta5s0yam
	BScSoHXTemXEbqltowZB/mhSHQCxY4B/dMkLwlXtb/og6RAfMnztYhq4S4D6QFtSK258SC
	66s0rtJygMMbUytE8BBDq5IrwPLQCcw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-NUjkVCgZO3ir45iFZDV1cQ-1; Tue,
 24 Jun 2025 08:18:20 -0400
X-MC-Unique: NUjkVCgZO3ir45iFZDV1cQ-1
X-Mimecast-MFC-AGG-ID: NUjkVCgZO3ir45iFZDV1cQ_1750767498
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C6411956048;
	Tue, 24 Jun 2025 12:18:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.226.80])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29B471956096;
	Tue, 24 Jun 2025 12:18:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C7278180039F; Tue, 24 Jun 2025 14:18:14 +0200 (CEST)
Date: Tue, 24 Jun 2025 14:18:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Ani Sinha <anisinha@redhat.com>, Alexander Graf <graf@amazon.com>, 
	Dan Middleton <dan.middleton@linux.intel.com>, Steve Rutherford <srutherford@google.com>, 
	linux-coco@lists.linux.dev, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Jon Lange <jlange@microsoft.com>, 
	"cho@microsoft.com" <cho@microsoft.com>, James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
Message-ID: <loxvc232xwxgndtgyh6rp4rw3uumvuvtwrlvcatrj63tsyhlrz@bp7bjcqrywwn>
References: <87frifm75c.fsf@redhat.com>
 <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com>
 <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
 <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com>
 <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
 <95a3e3ca-4fba-411c-b979-4dc8ecc1f902@amazon.com>
 <64D33153-BCA6-4971-97A7-110504B4AAA3@redhat.com>
 <CAAH4kHZUMP6it5jwnNv6XdC9NFzj3qAi1DmCTmajTDTYm1NYZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAH4kHZUMP6it5jwnNv6XdC9NFzj3qAi1DmCTmajTDTYm1NYZA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wHVRWXrLiGibIl794o6EDw_O6cu8jkSCkgkMvKatmx4_1750767498
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 23, 2025 at 10:08:16AM -0700, Dionna Amalie Glaze wrote:
> Hey all, I've been looking into the least friction-y way to make an
> IGVM readable from disk without having to add a complex device driver
> to the VMM.
> If the FUKI application chooses to read the firmware from disk instead
> of having the binary embedded, then we can insist that there exists a
> GPT partition on the same device as the ESP with IGVM partition type
> (let's say GUID C647E858-C402-4D1E-9497-95FF0A4B4465) that's the
> simplest filesystem format ever: "1FILE FS", 4 bytes of file size in
> little endian, followed by a contiguous representation of the IGVM
> file. If you want to change your firmware, create a new partition with
> this type and delete the old one. It's a simple enough file system to
> propose a DXE driver to OVMF for the FUKI application to use existing
> EFI protocols to read the file.
> 
> There's the matter of reading the GPT sector and finding the IGVM
> partition, then reading the file in the single file filesystem, all
> using some method of reading the block device that has mounted the
> disk image already that the VMM would have to mess with. The block
> device access depends on VMM architecture that I couldn't really
> comment on other than folks could probably make it work for Google's
> VMM. It'd need to do some funky continuation passing style for the I/O
> threads to string together the block read requests, but it shouldn't
> be too terrible.

Well.  That assumes that the VMM host can access guest storage.  Which
is according to alex not possible with aws nitro, and also for qemu this
is not guaranteed (although it is possible in many typical
configurations).

So, with that in mind the envisioned workflow for the FUKI boot is this:

 (1) first stage boots, firmware loads guest application from disk
     and runs it.  The application is expected to typically be a linux
     UKI, with either the firmware embedded, or loaded via systemd-stub
     add-on.

 (2) The systemd stub (the code which runs first when loading an UKI)
     will figure whenever a firmware update is needed.  If so it will
     invoke the firmware update process, otherwise launch the linux
     kernel.

 (3) The firmware update will pass both the firmware (as igvm file) and
     the UKI (efi binary) to the hypervisor for the second stage launch.
     For passing the UKI there are multiple options:
       (a) original design idea is to simply pass on all memory pages in
           'shared' state from stage1 to stage2, so the guest can use
           that to pass the UKI to the next stage.
       (b) alternatively the firmware igvm could be modified on-the-fly
           to carry both firmware and UKI.  See also
           https://github.com/microsoft/igvm/issues/91

 (4) hypervisor re-creates the sev-snp context and launches the igvm
     file passed from the guest.  The second stage firmware can go
     launch the UKI passed from stage1 directly, there is no need to
     go though storage/network setup again, which should speed up the
     second stage launch.  IIRC that detail was not mentioned/discussed
     in the call last month.

The vmfwupdate device has been designed to solve the "pass firmware and
UKI from stage1 to stage2" problem.

There are a number of options we can consider moving forward:

 (a) Instead of making the vmfwupdate device the common API we could
     create an EFI protocol instead.  So the vmfwupdate device would
     effectively become an implementation detail for (probably) qemu and
     aws, and GCE + Azure can choose to do something else instead, for
     example store the igvm on some standard location on guest disk
     where their hypervisor can find it.

 (b) Caching.  Allow the hypervisor to cache the initial state for the
     second launch, so going through the whole process is needed only
     after firmware and/or kernel updates.  With that added the guest
     obviously needs some way to invalidate the cache.

take care,
  Gerd

