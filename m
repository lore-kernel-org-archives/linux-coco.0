Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15956944E
	for <linux-coco@lists.linux.dev>; Thu, 20 Apr 2023 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682028961; x=1713564961;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IS7ZXuBIDcdEHWCz73K8Pgp/gskIbDBObXQBP3E1Hs8=;
  b=hyqamzC1v8h9mNqStbM7O/46KSCSqNnhrWeGOEBhjtUw6jy4zZnKTjs8
   wMG6qc7NVciclxdw3Fwhg2DL4OIWlJG+ZRm3ANUkz5TDLq9Wn/4wKDxQa
   WK+ru/NajcLFKUGQsKYSlh3ae1u3EthrFkGR2twObmUAlXjWr4SfVoKdd
   LrVaY1n1SEMI5ZAQmXLfj0zve23I5OlR0AAkrop8f5UGvb/AZcENx7/NX
   LsGcbYR693/8Q5nQqYfLcb+6fZb0lUHJYp0ZSV908D3+u6w/OBO8KOOtJ
   +3AS0eSy4SizCku8TxkWNWaVWZAf9QBZU1QiZXhqmGNJ4Ix3/EHYi957X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="373781269"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="373781269"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 15:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756693577"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="756693577"
Received: from ashleyst-mobl1.amr.corp.intel.com (HELO [10.209.71.65]) ([10.209.71.65])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 15:15:58 -0700
Message-ID: <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
Date: Thu, 20 Apr 2023 15:15:58 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap
 hooks
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev,
 Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com,
 Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren
 <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Uladzislau Rezki <urezki@gmail.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <20230419221716.3603068-46-atishp@rivosinc.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230419221716.3603068-46-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/19/23 15:17, Atish Patra wrote:
> The guests running in CoVE must notify the host about its mmio regions
> so that host can enable mmio emulation.

This one doesn't make a lot of sense to me.

The guest and host must agree about the guest's physical layout up
front.  In general, the host gets to dictate that layout.  It tells the
guest, up front, what is present in the guest physical address space.

This callback appears to say to the host:

	Hey, I (the guest) am treating this guest physical area as MMIO.

But the host and guest have to agree _somewhere_ what the MMIO is used
for, not just that it is being used as MMIO.


