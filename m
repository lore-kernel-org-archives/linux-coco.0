Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293F21423C
	for <linux-coco@lists.linux.dev>; Fri, 27 Feb 2026 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772198299; cv=none; b=abp4L3DS395UXqrdngO2Waz7YMmOYX9EMbBkn3vqCZBbSq/NJronLQZuBmbOY8TAiNENsc+iYanbe1jZXq4FPNArAkJBIwKaot3RI33rJXglq4yfdYgs89fwCVtbN0OUEMALJrghifJ97jdDtdUbgZoqxIJAzoVJFuqhD/VUDC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772198299; c=relaxed/simple;
	bh=L/z+htTQOMeMfJb12gYYUmgCXubeh01T5SyfZ35RqHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2RjAA5w5a3yiVmJp/ZwKsh2zLtk99zjwJycOTuFit7kaq+e5I2RUNIjjGwxNYqWmLgAyA8gjKhwHlFjdlKyUYeNdpEwjSNlH6R1AeL4k9G3zDRwSQWheSi6maVNSuqAW5Mbj5AzhtJ/WKzvi7XIJc9sY86c1GJ501P3YrH88p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kxc8UE1a; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kxc8UE1a"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c6f21c2d81so194106485a.2
        for <linux-coco@lists.linux.dev>; Fri, 27 Feb 2026 05:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772198297; x=1772803097; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/z+htTQOMeMfJb12gYYUmgCXubeh01T5SyfZ35RqHM=;
        b=kxc8UE1aTJ9C020lgyvkOCD5tGKDVm3gFbmqCWYJRBqi5TFzmPg2wb3DQJN91ucUxG
         lmJkP5BOyXi3e1Cd/65HpZwv2n6o7/AZHqf+QFLSPa78WxH/JhHcL7g13FnXjN2XJkrG
         r7a1Nhzp3FhT6PmuStIerJ4GvX3ad5t8aNQXT7EjC1rj2uLRUePRn1Z21tEhQtpA5Ago
         eoM0ivC+U/3WP5Bqe8jvGAB5W9adZa/V5yvEUU1N6NJQUX9Zx5QdNKqd1XRiZDqcC/Ls
         FS6ckvKkcJiW8ywXGb0wqpSgJAdhtt2hSNbnv+b8jioLCsT0RxMM+tazDjFEhxqpJ2vo
         PDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772198297; x=1772803097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/z+htTQOMeMfJb12gYYUmgCXubeh01T5SyfZ35RqHM=;
        b=jFWxuPyaZ6xElMgpdYSCP7zJwIWUNQRxen32K6ahc3HKlT75mgYkXBmdF8aVAmm4mi
         gjMVcyJ0dxfxvalcK457HNcI8IM3wEIgcviaDwyghEgUnCgjdK4hl24HXlJzEQb9g5Ju
         j9YVVigc8gj94R6BG31Nrv5M3AJaxRsHW2Ocerpd2o4laU74AOr/GqNd1TzZP3wcsDWo
         TSnnNvsJSmS7QJchsCr6vxX6A+H5A5Pv0Wi9U9d9D4JcO28ob0GZC1dCzm/LKyX5i570
         F0E4VgqaCf2THJmxm+B+PqM7eS0DZENVOProyKSGExYwBZXrVYyB/QK8Bsirmv5Sca2u
         Ya/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOQo9H3nI02JRj73AUOZRsgw5Bc2SeHeU5EXWsydP0MxnBoTVo+D09JMfjGX3m3H6FVQ9nGWRDqe6K@lists.linux.dev
X-Gm-Message-State: AOJu0Yy92oXXDiTq2P1AtFjQFT/5FdraaIWPHXLwra1lrstrOzyngCQF
	ubE5nF9PmuFE2/D+aynk0/Cdkwqzbu7m3099JMvvKXtOYRYo02C8p4oKC7T8tS+Rn8s=
X-Gm-Gg: ATEYQzxgr2GfMqR/ZvY75555neka2b15fNzqD0gvKnq6+o5yk4JoDT1vQYlZV9W8uA7
	wuh0TITfleHB1E5bCqGAdZ4pXhzyeFVjsfpM3PAfb4Bnf0cALdcwRd4huHpgGTDXKYgkl8QLjYM
	QIC1w4i8IIQb1FeDL7bZLnO+9VGeErRUs2c/AAGJ3oHUsVoDdkQd80z4UmD/v53xcgfEQMHgknb
	elZbGBHOAW9EjeRHUayv9+EssMZBTGuut4cpI1hmGC2XcIF6bwyv14Aw0oR+4iHj5JUx2baHELP
	OgZ97x9FyfdYFKvSVVQSY5jjZ7GgFQZd9/M6NAZOsH/XFO58hw413Zm2JcSDhAwfS6yM7FdwaXh
	60xsw9Yhobslu4AKazetF8jfpgIjaVDFVDTyDq6OADffOGcs4pZBBfYhVQUBG/kMB/5cZ8QYDWP
	eIm5RdFb3OBmttjpwGsewv1oMkcpez0t5V2b7iM+KVkUqgLD/2yKlqHINHcIJQpeEzCutYzH3st
	L5JEj+BxX8dnHNQtCg=
X-Received: by 2002:a05:620a:4891:b0:8ca:2a04:3ff3 with SMTP id af79cd13be357-8cbc8e8096amr324078985a.30.1772198296803;
        Fri, 27 Feb 2026 05:18:16 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7193227sm41395436d6.21.2026.02.27.05.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 05:18:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vvxjT-00000000uvx-0Dij;
	Fri, 27 Feb 2026 09:18:15 -0400
Date: Fri, 27 Feb 2026 09:18:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Alexey Kardashevskiy <aik@amd.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Steve Sistare <steven.sistare@oracle.com>,
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	Santosh Shukla <santosh.shukla@amd.com>,
	"Pratik R . Sampat" <prsampat@amd.com>,
	Fuad Tabba <tabba@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	michael.roth@amd.com, vannapurve@google.com
Subject: Re: [RFC PATCH kernel] iommufd: Allow mapping from KVM's guest_memfd
Message-ID: <20260227131815.GG44359@ziepe.ca>
References: <20260225075211.3353194-1-aik@amd.com>
 <aZ7-tTpobKiCFT5L@google.com>
 <CAEvNRgEiod74cRoVQVC5LUbWDZf6Wwz1ssjQN0fveN=RBAjsTw@mail.gmail.com>
 <20260226190757.GA44359@ziepe.ca>
 <aaDL8tYrVCWlQg79@google.com>
 <20260227002105.GC44359@ziepe.ca>
 <aaDlRdnhIqRXEbPZ@google.com>
 <20260227010902.GE44359@ziepe.ca>
 <aaFzgGTpZI0eZWdD@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaFzgGTpZI0eZWdD@yilunxu-OptiPlex-7050>

On Fri, Feb 27, 2026 at 06:35:44PM +0800, Xu Yilun wrote:

> Will cause host machine check and host restart, same as host CPU
> accessing encrypted memory. Intel TDX has no lower level privilege
> protection table so the wrong accessing will actually impact the
> memory encryption engine.

Blah, of course it does.

So Intel needs a two step synchronization to wipe the IOPTEs before
any shared private conversions and restore the right ones after.

AMD needs a nasty HW synchronization with RMP changes, but otherwise
wants to map the entire physical space.

ARM doesn't care much, I think it could safely do either approach?

These are very different behaviors so I would expect that userspace
needs to signal which of the two it wants.

It feels like we need a fairly complex dedicated synchronization logic
in iommufd coupled to the shared/private machinery in guestmemfd

Not really sure how to implement the Intel version right now, it is
sort of like a nasty version of SVA..

Jason
