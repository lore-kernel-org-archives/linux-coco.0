Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E66381D5
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706734833; cv=none; b=pA/fCZ62uNeJB3SUZPwPLf6PP056Oqiq78x/2PsAFo4WdMzzD/2KXEpXZB4SggMj97N+5TPXo5H/gFO1HlPVc5vg9v3CdR424bZmZR8BdWsjwr5dkxJOvT+Vmpo1qTfuTRGQt8fGxPggGpAVRHu8DmfF/+CwxYmgFKA8cM/jV0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706734833; c=relaxed/simple;
	bh=ePhKw8burSTeAX/e3o92AUYp9PmNnNsKBZTfCZnb2ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dZ1POsyERdpIKqgkjoR8+Exr8+1wyX9QgL7wgPolqkZlf9tSToQaHqB3fJUB/AnQRb6bc3Vz5iefFQwVPBE0S2vEvB+wDqGGyM4OtfZzFOqk34X877LcPzQ5SSle7skUT2JgtqCDsReQjBvmdsMnpw4FiO4y6IL1s1f/8DfYoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rm15Elf7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rm15Elf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706734830;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=HWHmqn7hx3FbwiymlHt5g9Ul9BQ+5rzy5ovtHRMMs5M=;
	b=Rm15Elf7w+OOLrLGKQ5aQx/DOPznsdpdZ+9t6Ja97VTPkkDY4Q2sbDzAUDDpbjglOAZAjU
	rAbfMJLUKXR9GJ9mOVkFbJNeB1bNm0Ygc0Xh3TeSoTNXLeSLcC/m9fsoP1lubSt0LUDeiX
	1IV3oTCSvo2KxsGehtWZ7c6XU1j4/hk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-267-7QAU2XYdMgKue_crt0yw-Q-1; Wed,
 31 Jan 2024 16:00:25 -0500
X-MC-Unique: 7QAU2XYdMgKue_crt0yw-Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB91B38143B5;
	Wed, 31 Jan 2024 21:00:21 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD39492BE2;
	Wed, 31 Jan 2024 21:00:20 +0000 (UTC)
Date: Wed, 31 Jan 2024 21:00:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev,
	x86@kernel.org, dave.hansen@linux.intel.com, dionnaglaze@google.com,
	dan.middleton@linux.intel.com
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <Zbq04j1Av2znlKIC@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 31, 2024 at 12:44:46PM -0800, Kuppuswamy Sathyanarayanan wrote:
> 
> On 1/31/24 11:50 AM, Dan Williams wrote:
> > Kuppuswamy Sathyanarayanan wrote:
> >> + Dan Middleton
> >>
> >> Hi Boris,
> >>
> >> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
> >>> IOCTL based interface was the natural choice for interacting with the
> >>> quote generation machine at a time when there wasn't anything better.
> >>> Fortunately, now we have a vendor-agnostic, configfs-based one which
> >>> obviates the need to have the IOCTL-based interface.
> >>>
> >>> Gate the relevant code behind a Kconfig option, clearly marking it as
> >>> deprecated as well as introduce a runtime warning.
> >>>
> >>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> >>> ---
> >> In the following thread, Dan Middleton raised a point about this interface
> >> being used for local attestation use cases.
> >>
> >> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
> >>
> >> Currently, the configfs-based ABI does not support the local attestation use cases.
> > What are local attestation use cases, and what happens if Linux does not
> > provide a local attestation interface and standardizes on remotely
> > attestable as the standard?
> 
> 
> Local attestation is used by one TD on the same platform to prove to another TD
> in the same platform about its identity. It is mainly used in cases where a TD provides
> some special services required by other TDs. Since they are all in the same platform,
> there is no need for a 3rd party verifier or Quoting service. It can use the verifiable MAC
> to check the correctness of the TD.

As an example of where this might be needed, consider supporting a vTPM in
TDX. The TPM impl would likely be run in a separate service TD, and need to
be locally attested by the primary TD, to establish trust in the vTPM.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

