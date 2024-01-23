Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D51A823D4
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706039861; cv=none; b=ZAgzLwWeMJiTSsxr4YQf/xJ19AnSOBQEiU7dM30mHM46RWVW6LCV5Id3L4quyhTp5diltx8s5xdJ7T7xG4Q1zl3WMkoCTj1gsWg8m0NLYWxHeG2FehlcQgPEaOJRwMpUF2pwSaeEfmVz+55yEUW+Iu1V1xH6exOPHXLh6w4uxhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706039861; c=relaxed/simple;
	bh=gv1DX3qDboW/6yRx2XyJUGmrHzFoE9rDCyOWbJVc7vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RZ6IjhuudSZrT1NtW2Tlpu1jGd2/i9GV7aZr3t0MErj6V3Ca5xdzpg/P2b3P2LHjZfZ8Cc9yWJ9LB6Grq4yhGBiNiEYJfdl897D5ajWgMIbporgrZRVXbStczQkSli5zmo35DJtsFQathoHgKayqQV8GC33ufOkzu1NQ6hPNKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ts02z8Hn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ts02z8Hn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706039858;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FmzS2EE1as4Ca/VNKz3nSgRcmIcg5qQtytba5yF0mQ=;
	b=Ts02z8HnuLj6BR1JIyzlJ+NUeU7AehcBLHyoykIoUf6zFhyIMeRqnmN0FoHp1SZL4c8wlu
	5/JPv8aHCkOUatpDa/zRbL/809zrPKFJGPVgOSyRaebHGijdJgmv2f/W6+Es7ue8yO6xs6
	C9B52qqa6kFOOH/IN8P6TKLkIGg+qew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-9be9ZkYIOdeDYgUgTaHQbg-1; Tue, 23 Jan 2024 14:57:34 -0500
X-MC-Unique: 9be9ZkYIOdeDYgUgTaHQbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4FE3185A784;
	Tue, 23 Jan 2024 19:57:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91562166B32;
	Tue, 23 Jan 2024 19:57:31 +0000 (UTC)
Date: Tue, 23 Jan 2024 19:57:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-coco@lists.linux.dev, dave.hansen@linux.intel.com,
	x86@kernel.org, kirill.shutemov@linux.intel.com
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
Message-ID: <ZbAaKAh-230Hj4BF@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240123160704.1270147-1-nik.borisov@suse.com>
 <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com>
 <ea5dc4b4-6aed-4672-bbe6-e2f477528f36@suse.com>
 <65b00e191087c_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <65b00e191087c_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 23, 2024 at 11:06:01AM -0800, Dan Williams wrote:
> Nikolay Borisov wrote:
> > 
> > 
> > On 23.01.24 г. 19:51 ч., Kuppuswamy Sathyanarayanan wrote:
> > > 
> > > On 1/23/24 8:07 AM, Nikolay Borisov wrote:
> > >> When this driver got merged initially there was no widely agreed upon
> > >> interface how the quote generation interface will work so having an
> > >> ioctl made sense. However, there's now a vendor-neutral interface via
> > >> configfs. Just remove the old ioctl interface and leave only the the
> > >> configfs one.
> > >>
> > >> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> > >> ---
> > > 
> > > This ABI allows the user to get the raw report which is further used
> > > for Quote generation via vsock. AFAIK, some vendors (TDX users) and
> > > DCAP user libraries are still using this ABI to support attestation over
> > > vsock model.
> > > 
> > > Don't you think we should wait till there are no users before considering
> > > removing it?
> > 
> > Given that hw with TDX was just released I'd be surprised if there are 
> > any users? But then again, this is an RFC so let's get opinions :)
> > 
> 
> The assumption is that this tdx_guest_ioctl() ABI has never appeared in
> an enterprise distro kernel. If that assumption is valid, it
> significantly reduces the long term support exposure.

This ioctl is present in current RHEL-9 kernels

  https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9/-/blob/main/drivers/virt/coco/tdx-guest/tdx-guest.c?ref_type=heads#L69

and this is exposed to users when running RHEL-9 guest on Azure
cloud with TDX support.

I've not directly checked, but I would assume it is also probably
included in Ubuntu LTS kernels too, since they also target TDX in
Azure.

No idea what the status of SLES is wrt TDX / Azure offhand.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

