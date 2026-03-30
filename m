Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B5A3E6DFB
	for <linux-coco@lists.linux.dev>; Mon, 30 Mar 2026 22:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910028; cv=pass; b=US6ax60YWiJu/JqCM+M4mbtemLn8mRmmxDPfI1gDhzfMdhYqST6/dB1fysoHsTtWDln4WSPvyhKsSaByH53Y83oKjcJcbIA0z+92dU0963fCOpAxW4CfJI9KQF7NkI+/Wf+Lo75P5WX8lt2Wx21Xo3cIMkJqtYEDk7rcO3Ni8NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910028; c=relaxed/simple;
	bh=e9kO4i8JRYHa4vG3b7wxafUDCr6xuJfaRYocvq41hns=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YOqZ1UkneozfKa1RmaSaMvpmap352r1oEteCN90Bfz9/5VEaiRgVycgnsFG97aazd/JC10XNrAguIdtgezVqxpGz2bVSZiPlqmkmEmr+Npf4BuyO5aulrAIaFIbmlfryo8wmDm6b41YhySZMBy1W+dWSprwH4fw8CyJqeqDHHv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXaEfsxb; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXaEfsxb"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ee072d105so813889d50.3
        for <linux-coco@lists.linux.dev>; Mon, 30 Mar 2026 15:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774910019; cv=none;
        d=google.com; s=arc-20240605;
        b=RDiw+jU4BQwIW9CyFSu7KmlQCfZuzI91KBQfH1gPLoUFTbYuD9o7TG8HO45e+MIMLh
         VZqZxOYCRONw092J2uKAUTkV8Dr0O1NLci/rcDHuk+LeIy+xxOrY6As1N9/ysTEJCAnv
         Fa6J9NWHe53uxshCqpUY+//gzdfRoeUx1fxWV1eL+Zc4EPB6K9S9x1W3dCd9R0ntaYrt
         OWkhlqMT7lB9a7qy+BbPXNvzyGaxLysyKzBVc7eUVVgFK2FvpLYuFkrvmJramadtF+Hc
         wGUDvbS1VB6BGH8sTmpu2zayNJlr8eDq+/OH9BBp6EL2STOxaf4YtzP+ALF3KnnNra6j
         q0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=iSQIVtNwmgy11GPH4hBTtVMQtkU5/chWZgBufGmlYz8=;
        fh=JhPi5KfkmA3Vm67z26QgkbqFTxOvkF744gya2QTcJxY=;
        b=dqrRm1aKHcgvxKXI5HbaIG+Aj+DJz6mpIYAKAT2i/xtGLHfAdnEhfovhLrow6I8qyw
         oHIUijti9UfLwiK1ZnQW7AvKPFso21Y6qGdtxz6fgARZsY7ejOlWhkC0QAkcJQ7cHzv8
         Br3fAed2l9kZhYjKeUqfAHNJyl0k1z9MZf0vzqIc1Zdi1+p/Nms8rQaYOQUrA8XZXA3u
         XHwIHyNDkWd3STGDES/LZsmfzT4aLN8y7A9GQYfzy3DJGy1x3OO7RgZixwUOS7GtRxeO
         usqf48j03sj4f9oHprxBEmAzLq3cS1cgmgqRcF5nTC4hkcokGHLN+35ii91W3QNZmG7v
         sUDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774910019; x=1775514819; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iSQIVtNwmgy11GPH4hBTtVMQtkU5/chWZgBufGmlYz8=;
        b=RXaEfsxbWdpYqUxOR3ak2v+5c/NY4svOFXQqBr8Dzng1WQ0q87OqWdp1kwIKx4bF3r
         VEJ27KlhUq24eFpf88k1P99d/1hWWcrF2fX60MnrB2K5vs9OU6WKg1YZQwYW+xA27qbl
         XcDfgiVzNOhPEQ2wkWq3NzTAmXIsCk2Ue/qrHfwG/aIhYQUyJa/QLTO9SIibPoOAbj0q
         TdkGUy+5MJskf4pQ2bdV4KjhvhuSKw+PWB1jIJXlXPxlllj+N7Rz70A82doMtyxOJZs5
         13unId0u+G1hZ5qljHqY5kPXPB+Yp/o/w05AsJyJKIqA6WpzRSLIOBzdIVepQGmOu5MB
         3B9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774910019; x=1775514819;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSQIVtNwmgy11GPH4hBTtVMQtkU5/chWZgBufGmlYz8=;
        b=AwoL7xG59QmTLN8xqBiRzZx/vqVV8ddUtWNyOBefy6nKy42MOzQye+EohReA3ZvT+R
         Bai3wys8LxyQnk5Nzk7r0CBZUPasGe2/l83sUYsAAMbCtqkcKfxYu6BuNTui0w49favc
         nZcW3JnLseAK5ZhaCUedQhpIakjB23HjysIxsg0mZDDEqEKvOdnNDFKl4s9BZyStlDmi
         nH5ajiaP/2b231Pck+GmI5pKmWbsnUSCepzDqB6/nAU2eLdmMOq2TQmmI/TwO6slEVwe
         6/dok/8FMBPaIXNy5vDYxGoPChv02U9ffmoIHlYgk+iecBN8+Nzd0XFV+ytlmO1U/vqj
         61YA==
X-Gm-Message-State: AOJu0YzaJsjFLiAmxMG/3MT4wi5KJCuJoMGVWrGl2N9i8HnqX8KQi2xa
	dDzk+nFXRmK/unGNYgLD94y415RzgrR0ggZDXEwcGRo70I/UyidVGItomXGi9ImXY4hi3azQ0yz
	2ib9oq72thBG/voqHXfExxbNZ/38IAXw=
X-Gm-Gg: ATEYQzwV21qpj4nu/QlR6pEF9Xlr6U+GHtUnnn5fwcTbnOpLvoBeFcTdCGcjGi5nq/a
	IyKBz9Xz9UyF7Nf45k20C6k0yUI1r/dMtAmCnuyxs365yLS5RolS8domakD+IFnfmDnIdk/Ks9b
	dkKm7cKrJGnnjh1uxOIlMmzHNhTgSJAxVayg3crSDZiw3kzfGrfPlpZgbkZEpq+fFSG9kWLPS8e
	8bxTeMU6bnv+qniYSeq2Tk5ldCv6jJp6hIOER1nEGKxU4x3EZz2x04KSi1+b1dSddda4yXVrmhO
	cLVEeT5RsLPtGpqaPb4Bv9avQ+ED/acbQ3mMRegazA==
X-Received: by 2002:a05:690c:e363:b0:79f:6e27:a4da with SMTP id
 00721157ae682-79f6e27a8c0mr34255967b3.1.1774910019233; Mon, 30 Mar 2026
 15:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Borys Tsyrulnikov <tsyrulnikov.borys@gmail.com>
Date: Tue, 31 Mar 2026 01:33:28 +0300
X-Gm-Features: AQROBzBOf-pe5jARXyQ2xtgPPEYRjgNTKCd_ydItIeFDxwB4jvitxg0Ydy4TYnM
Message-ID: <CAKw_Dz96rfSQc6Rn+9QBcUFHhmkK+9zu+P=bxowfZwxrATCBRg@mail.gmail.com>
Subject: [BUG] x86/tdx: handle_in()/handle_out() use one-bit-too-wide GENMASK
 for port I/O
To: x86@kernel.org
Cc: linux-coco@lists.linux.dev, kvm@vger.kernel.org, kas@kernel.org, 
	dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

handle_in() and handle_out() in arch/x86/coco/tdx/tdx.c use:

    u64 mask = GENMASK(BITS_PER_BYTE * size, 0);

GENMASK(h, l) includes bit h. For size=1 (INB), this produces
GENMASK(8, 0) = 0x1FF (9 bits) instead of GENMASK(7, 0) = 0xFF (8
bits). The mask is one bit too wide for all I/O sizes:

    size=1 (INB): GENMASK(8,0)  = 0x1FF       vs correct 0xFF
(extra: bit 8)
    size=2 (INW): GENMASK(16,0) = 0x1FFFF     vs correct 0xFFFF
(extra: bit 16)
    size=4 (INL): GENMASK(32,0) = 0x1FFFFFFFF vs correct 0xFFFFFFFF
(extra: bit 32)

In handle_in(), this causes the VMM response's extra bit to overwrite
one bit of RAX that should be preserved. For INB, bit 8 (AH bit 0) is
overwritten from the VMM response instead of being preserved from the
guest's prior AX. On native x86, INB only modifies AL -- AH is
preserved.

In handle_out(), one extra bit of regs->ax is sent to the VMM beyond
what the I/O width requires.

I did not find a broad exploit in common kernel callers under tested
GCC/Clang toolchains, because many typed u8/u16/u32 paths naturally
truncate or zero-extend the value before reuse. That is not a full
non-exploitability proof, though: some ordinary in-tree caller shapes
may still preserve the primitive, especially read/test/write-back
sequences such as inl(...) followed by a branch and outl(same_value,
...), or inb(...) followed by if (v) outb(v, ...). I am therefore
treating this as a correctness bug in the #VE emulation path with
guest-config-
dependent leak potential, not as a proven broad exploit.

Expected vs observed (INB, size=1)
----------------------------------

Native x86 INB: writes AL (bits 0-7). AH (bit 8+) is preserved.

TDX handle_in() with buggy mask: clears bits 0-8, then sets bits 0-8
from VMM response. AH bit 0 depends on VMM, not the guest's prior AX.

Live reproduction
-----------------

GCP c3-standard-4 Confidential VM (TDX), kernel 6.17.0-1009-gcp, 2026-03-30.

Kernel module sets AX to two values, does INB from CMOS port 0x71, checks AH:

    Test A (AX=0x0000): result AX=0x0026 AL=0x26 AH=0x00
    Test B (AX=0x0100): result AX=0x0026 AL=0x26 AH=0x00
    *** AH same in both tests (0x00) -- bit 8 from VMM, not initial AX ***
    *** GENMASK off-by-one CONFIRMED on live TDX ***

    10x test: bit8 set with AX=0x0000: 0/10
    10x test: bit8 set with AX=0x0100: 0/10
    *** Bit 8 independent of initial AX -- CONFIRMED ***

In test B, AH should be 0x01 (preserved). Instead it is 0x00 --
overwritten from VMM data. 10/10 consistent. Reproduced twice on
2026-03-30, including a fresh rerun on a new GCP TDX VM.

Additional live write-side confirmation
---------------------------------------

Separate raw-asm kernel modules confirmed the write-side primitive
reaches the outbound sink for all widths:

    [outb] before outb A = 0x005a
    [outb] before outb B = 0x015a
    [outw] before outw A = 0x00008086
    [outw] before outw B = 0x00018086
    [outl] before outl A = 0x0000000012378086
    [outl] before outl B = 0x0000000112378086

For correct emulation, only the intended-width values should be
exposed to the VMM: 0x5a / 0x8086 / 0x12378086. With the current
handle_out() mask, the paired local payload simulator gives:

    outb: 0x05a vs 0x15a
    outw: 0x08086 vs 0x18086
    outl: 0x012378086 vs 0x112378086

This is not a host-side capture on a controllable TDX VMM, so I am not
treating it as a full confidentiality exploit. It does strengthen the
claim that the extra-bit write-side primitive is real on live TDX for
outb, outw, and outl.

Secondary issue: missing zero-extension for INL
------------------------------------------------

Separately, handle_in() does not zero-extend bits 32-63 of RAX for
size=4 (INL). On native x86-64, INL writes EAX which zero-extends to
RAX (Intel SDM Vol. 1, 3.4.1.1). handle_in() preserves bits above the
mask instead.

handle_mmio() in the same file handles this correctly:

    case INSN_MMIO_READ:
        /* Zero-extend for 32-bit operation */
        extend_size = size == 4 ? sizeof(*reg) : 0;

read_msr() also does it correctly:

    regs->ax = lower_32_bits(args.r11);

handle_in() has no equivalent. Same compiler truncation caveat applies
-- no known practical impact via standard inl() callers.

A separate raw-asm kernel module reproduced this on the same GCP TDX
kernel. Preloading RAX=0xDEADBEEF00000000 before INL 0xCFC produced
RAX=0xDEADBEEE12378086, and preloading RAX=0x1234567800000000 produced
RAX=0x1234567812378086. Bits 33-63 remain stale from pre-INL RAX; bit
32 reflects VMM-controlled data; lower 32 bits contain the expected
PCI config data.

Fix
---

In both handle_in() and handle_out(), change:

    u64 mask = GENMASK(BITS_PER_BYTE * size, 0);

to:

    u64 mask = GENMASK(BITS_PER_BYTE * size - 1, 0);

Reproduction modules available on request: portio_test.c (read-side
INB), portio_pure_out_test.c / portio_pure_outw_test.c (write-side),
portio_zeroext_test.c (INL zero-extension).

    Tested on: GCP c3-standard-4 Confidential VM (TDX)
    Kernel:    6.17.0-1009-gcp (Ubuntu 24.04)

Borys Tsyrulnikov
