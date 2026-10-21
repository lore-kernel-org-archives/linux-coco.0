Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599394;
	b=HEGVDjdHpv5Z6m6f2o2WkhT/VSp0HYEItbmOUBOFocYl2BJdr4VTlr82E2xPetDS/uNv
	 +9Rs6W8JWmwpF9HA5huAzQoeQDR56nGstI3XKntUxOUBIvoe8HJ9dLC/IDy4llX5040QS
	 d2F90BV+uQ7CeCgkxLEGOpZCDJy4BPC2U0rWndQEKl4Xk+FwlKdvrSU20yKhxGBXjE3tz
	 r2yKcxEmJAiv761I+mv+MshgW1qYrBC3ZDlHOy6D9n9IwSXAJVq2MuZlksRg+Pqg4Ssoe
	 0TTPMvyE8oJSfmF8RbQLltR9Ala/n0hZeq+HT3/PMolXxzJcOH5xwPEhY6ZA9TwHmtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599394;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=I4fExWWHQfHqyUEeP/lXCLS3UZaAlkJ5mBxOj4iktHE=;
	b=AkgMurB+0Yi4Q5s2yOLal9coUwT6fB09cEqKkoWrlP3PVfS0q3Z+pLBFpQ9kGdGSn67D
	 CKw1Zfg2PJLNWWgqkv+STYyDK+XHhjfe92T6p53oKp9bgkOhIpiRIxAfMVKxKNI4gaXwm
	 zsZfsYkQ8EjwAMzNEgQb4S0cY0yL3bS/5dLzW1yj9xiFtrAuNf2daCiMuyoLeRmJlsCUq
	 4qO91/tjkczrt8Zv0Mv2irplruPl5QvC7jQ1EilgI9AoVTaOz9b9utqturoLt1bF/juHT
	 W0k6zJxNJ/3XWjalSGja/2/vloPvT72kH7KljEQK0YOduWGZpvlhVb6IGSdGF2cOmLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nGCPpxsU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306E606A552;
	Wed, 21 Oct 2026 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nGCPpxsU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BF81F000C1;
	Wed, 21 Oct 2026 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792599393;
	bh=I4fExWWHQfHqyUEeP/lXCLS3UZaAlkJ5mBxOj4iktHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nGCPpxsUs4AvaWFhNU3hCDoWDL+/491Ja1Ge+UAeHCAMLn+P65iDIBcQIIBP9d4Ap
	 bMYEeRz4pgVCIGqpqh4+MKCZ+a4he9z2d84c9tcRQZ9vssLTGdLVpORCNxcVWIKnv2
	 dd0YyPrvKWsmKsp9Sv3eZ5Tfw+EwwuMRfr4L7Txdr0VZe7crztysVmyciYjBbkyqLd
	 Ps57Smw9NLgfrfnAeDoWftW1myB8xt6bVXXSk9f2ZaLSR854azFasI64ryNttTYhKz
	 lsCfX92+OT3Ym5tCTthLZn/1YA3mWXXBSBM+tCh3Ri8TfQru8lokx4F/zoXJbrXa3D
	 6EW2a22re4f4Q==
Date: Wed, 21 Oct 2026 19:16:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	luto@kernel.org, peterz@infradead.org, ardb@kernel.org,
	akpm@linux-foundation.org, arnd@arndb.de, thomas.lendacky@amd.com,
	shivankg@amd.com, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v2] x86/sev: Apply the RMP table e820 fixups before
 memblock is populated
Message-ID: <atjlWMlcVsaHJOmd@kernel.org>
References: <20261020202818.368416-1-Ashish.Kalra@amd.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020202818.368416-1-Ashish.Kalra@amd.com>

On Tue, Oct 20, 2026 at 08:28:18PM +0000, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> When the start and/or end of the RMP table is not 2MB aligned,
> snp_fixup_e820_tables() converts the 2MB chunk containing it from RAM to
> reserved in the e820 tables, so that it is never used by the kernel (or
> by a kexec-ed kernel) and SNP_INIT marks it HV-Fixed.
> 
> The fixups are done from mem_encrypt_setup_arch(), which runs after
> max_pfn has been computed and after e820__memblock_setup() has populated
> memblock from the e820 table. The RAM part of those chunks therefore
> remains in memblock.memory. Commit 88a921aa3c6b ("x86/sev: Ensure that
> RMP table fixups are reserved") dealt with one consequence of that, the
> chunks still being allocatable, by additionally reserving them in
> memblock, but memblock still describes them as memory.
> 
> That trips up the direct map setup. init_range_memory_mapping() maps the
> memblock.memory ranges, so the RAM part of a chunk gets mapped. When a
> subsequent, lower range is mapped, the trimming in phys_pmd_init() or
> phys_pud_init() consults e820 instead, finds no RAM in the 2MB (or 1GB)
> slot and clears the already populated entry. At boot this goes through
> set_pmd_safe()/set_pud_safe() and triggers:
> 
>   SEV-SNP: RMP table physical range [0x000000bf77900000 - 0x000000c037efffff]
>   SEV-SNP: Reserving start/end of RMP table on a 2MB boundary [0x000000bf77800000]
>   SEV-SNP: Reserving start/end of RMP table on a 2MB boundary [0x000000c037e00000]
>   ...
>   init_memory_mapping: [mem 0xbf60000000-0xbf778fffff]
>    [mem 0xbf60000000-0xbf777fffff] page 2M
>    [mem 0xbf77800000-0xbf778fffff] page 4k
>   init_memory_mapping: [mem 0xbf40000000-0xbf5fffffff] page 2M
>   WARNING: arch/x86/mm/init_64.c:89 at phys_pmd_init+0x389/0x4b0, CPU#0: swapper/0
>   Call Trace:
>    phys_pud_init
>    phys_p4d_init
>    __kernel_physical_mapping_init
>    init_memory_mapping
>    init_range_memory_mapping
>    init_mem_mapping
>    setup_arch
>    start_kernel
> 
> and leaks the page table page that hung off the cleared entry.
> 
> None of the fixups depend on memblock: the RMP table is probed and
> CC_ATTR_HOST_SEV_SNP is set from early_cpu_init(), and the segmented RMP
> case only needs early_memremap(). They do depend on the e820 tables,
> which are only built in e820__memory_setup() (which also populates
> e820_table_kexec), so the fixups cannot run any earlier than that.
> 
> Move them into a new mem_encrypt_fixup_e820() called from setup_arch()
> right after trim_bios_range(), before max_pfn is computed and memblock is
> populated, so that both are derived from the final e820 table, and
> finalize the table with e820__update_table(). mem_encrypt_setup_arch()
> keeps the SWIOTLB sizing, which needs the memblock-derived memory size and
> stays after e820__memblock_setup(). The memblock reservation is then no
> longer needed and is removed.

Although the commit message is a bit hard to parse, the idea makes sense to
me.

If we anyway have a range marked as E820_TYPE_RESERVED, just keep it
consistent with other E820_TYPE_RESERVED that never make it into
memblock.memory.
 
> Fixes: 400fea4b9651 ("x86/sev: Add callback to apply RMP table fixups for kexec")
> Co-developed-by: Shivank Garg <shivankg@amd.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>

FWIW: 

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> v2:
>  - Route the fixup through a new mem_encrypt_fixup_e820() wrapper instead of
>    calling snp_fixup_e820_tables() directly from setup_arch().  This keeps
>    the memory-encryption specifics out of setup.c (no <asm/sev.h> there) and
>    alongside mem_encrypt_setup_arch() in the mem_encrypt layer.  No
>    functional change.
> 
>  arch/x86/include/asm/mem_encrypt.h |  2 ++
>  arch/x86/kernel/setup.c            |  1 +
>  arch/x86/mm/mem_encrypt.c          | 14 +++++++-------
>  arch/x86/virt/svm/sev.c            |  9 ++++-----
>  4 files changed, 14 insertions(+), 12 deletions(-)

-- 
Sincerely yours,
Mike.
