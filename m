Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C05D171A2
	for <linux-coco@lists.linux.dev>; Sat,  7 Oct 2023 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 593B6100D587B;
	Sat,  7 Oct 2023 12:04:33 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 22C151C0227; Sat,  7 Oct 2023 12:04:33 +0200 (CEST)
Date: Sat, 7 Oct 2023 12:04:33 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Alex Williamson <alex.williamson@redhat.com>,
	linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, kvm@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linuxarm@huawei.com,
	David Box <david.e.box@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, "Li, Ming" <ming4.li@intel.com>,
	Zhi Wang <zhi.a.wang@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH 00/12] PCI device authentication
Message-ID: <20231007100433.GA7596@wunner.de>
References: <cover.1695921656.git.lukas@wunner.de>
 <652030759e42d_ae7e72946@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <652030759e42d_ae7e72946@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Oct 06, 2023 at 09:06:13AM -0700, Dan Williams wrote:
> Lukas Wunner wrote:
> > The root of trust is initially an in-kernel key ring of certificates.
> > We can discuss linking the system key ring into it, thereby allowing
> > EFI to pass trusted certificates to the kernel for CMA.  Alternatively,
> > a bundle of trusted certificates could be loaded from the initrd.
> > I envision that we'll add TPMs or remote attestation services such as
> > https://keylime.dev/ to create an ecosystem of various trust sources.
> 
> Linux also has an interest in accommodating opt-in to using platform
> managed keys, so the design requires that key management and session
> ownership is a system owner policy choice.

You're pointing out a gap in the specification:

There's an existing mechanism to negotiate which PCI features are
handled natively by the OS and which by platform firmware and that's
the _OSC Control Field (PCI Firmware Spec r3.3 table 4-5 and 4-6).

There are currently 10 features whose ownership is negotiated with _OSC,
examples are Hotplug control and DPC configuration control.

I propose adding an 11th bit to negotiate ownership of the CMA-SPDM
session.

Once that's added to the PCI Firmware Spec, amending the implementation
to honor it is trivial:  Just check for platform ownership at the top
of pci_cma_init() and return.

Thanks,

Lukas
