Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D997D21ABDB
	for <linux-coco@lists.linux.dev>; Tue, 25 Feb 2025 19:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.37.111.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511656; cv=none; b=Hg3DnwpEq4vDSLEPnydf6Ww+ZiZ7tUy3C5gF2r6J1VJRtirwzvHXLyXaz34U39LwXz6aaKYAaI3dKzRjICQkP/HzbkQ6Q3o8s8UDFL1LDvX5UIJwahMXBfODndMm2qg0wI8FcsplVImj6i01gNtbAhu4fg5K45rDDVk8rs27jKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511656; c=relaxed/simple;
	bh=vLuEqX20VcpwMfixBHjSSmmoeHRSdapWEDYaIrVVVpU=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=ImSkT1/y6yKiTdr42CzP0I4EGpFZzTFMMN8JhcPM8JuuOxZp/dSuxYO6mmkeZj8FexnVfTpNzQDshaGdPix5RQghz3G0kuwYznY4eh1xH6zNhrLmadne/qdJDchlLm1QDDrU5VOv7QJ/J+4Qio43Kw4n6B2qAj796pEZru7OzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=DZ9koJou; arc=none smtp.client-ip=198.37.111.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="DZ9koJou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1740511651;
	bh=vLuEqX20VcpwMfixBHjSSmmoeHRSdapWEDYaIrVVVpU=;
	h=Message-ID:Subject:From:To:Date:From;
	b=DZ9koJouo231pHZNW0cfPg1hwuoVuJdvNT+swcuHZQ1B4wt72iKbb0kaSWsPzAdS2
	 TBfQK8mMOPr1zZsYyUqs9S1I3vUMw11/3D8jaE0wLsCeT8EcJB2/x2NJawNXjwOx0j
	 mYxqbsXXxUiEqD2ft+PPNJnhgrlvCYSY8GAqKw/w=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 48DE11C256A;
	Tue, 25 Feb 2025 14:27:31 -0500 (EST)
Message-ID: <38fdf6373fe5f500115d09bcad391e14137b75b8.camel@HansenPartnership.com>
Subject: Using a linux bus for SVSM devices
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev
Date: Tue, 25 Feb 2025 14:27:30 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

It looks like I'm not going to make the next SVSM meeting, so here is a
brain dump on how the linux bus type for virtio works.  Basically it's
a capsule for matching (and automatically finding driver modules) for
discovered devices.

The way we should use it is pretty much the same as virtio (see
drivers/virtio/virtio.c for the bus definitions).  There's also a nice
series of blog posts which documents this:

https://www.redhat.com/en/blog/virtio-devices-and-drivers-overview-headjack-and-phone
https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels

The only real difference is the configuration signalling, which is done
over a pluggable configuration interface (which is either mmio, vdpa or
pci).  The SVSM only signals over the architectural mailbox API as
defined by the SVSM API Spec, so we don't need to bother with the
config_ops and can use a simple static C based API instead.

So I would say we copy virtio bus type, pretty much, with the standard
groups, match/probe/remove and uevent for driver binding and put it
under the drivers/virt/coco (or we could go with a new
drivers/virt/svsm).  Next we simply need a defined API for calling into
the SVSM (so something like the AMD abstraction which hides the calling
convention) which we define in a header instead of using config_ops. 
The body of the API would vary between architectures, so the
implementation would likely be in architecture specific code.

The only other question is what we do about device IDs.  I'm strongly
tempted simply to use strings, but all the other code does use fixed
length ids, so we could probably follow virtio_device_id except have a
single u32 for device_id (I've no idea what virtio uses vendor_id for
since every driver I've looked at leaves it as a wildcard).

The final thing would be to think about interrupts, but since the TPM
driver is strictly request/response, we can defer that until we know if
the observability driver will need them or not.

Regards,

James

