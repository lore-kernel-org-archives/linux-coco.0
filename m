Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA652F48
	for <linux-coco@lists.linux.dev>; Wed,  1 Nov 2023 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 12FA7100D9404;
	Wed,  1 Nov 2023 08:38:14 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id DEC64120EBC; Wed,  1 Nov 2023 08:38:13 +0100 (CET)
Date: Wed, 1 Nov 2023 08:38:13 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: TDISP enablement
Message-ID: <20231101073813.GC25863@wunner.de>
References: <e05eafd8-04b3-4953-8bca-dc321c1a60b9@amd.com>
 <CAAH4kHYgMKv2xYT8=4Vx7i8hhpCOMZNdzf8G4fbNdx=9gQ8Y1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAH4kHYgMKv2xYT8=4Vx7i8hhpCOMZNdzf8G4fbNdx=9gQ8Y1w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Oct 31, 2023 at 04:40:56PM -0700, Dionna Amalie Glaze wrote:
> Only read? Can user space not provide a nonce for replay protection
> here, or is that just inherent to the SPDM channel setup, and the

That's internal to SPDM, regardless whether SPDM is handled by the
TSM or OS kernel.


> These vendored certificates will only grow in size, and they're

The size of a cert chain is limited to 64 kByte by the SPDM spec.

A device may have 8 slots, each containing a cert chain.


> device-specific, so it makes sense for machines to have a local cache
> of all the provisioned certificates that get forwarded to the guest
> through the VMM. I'd like to see this kind of blob reporting as a more
> general mechanism, however, so we can get TDX-specific blobs in too
> without much fuss.

Cert chains and measurements from the interface report need to be
exposed as individual sysfs attributes for compatibility with
TEE-IO incapable devices.

Blobs make zero sense here.  Doubly so if they're vendor-specific.

Thanks,

Lukas
