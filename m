Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FB717F
	for <linux-coco@lists.linux.dev>; Tue, 10 Aug 2021 06:26:25 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id w20so12645366lfu.7
        for <linux-coco@lists.linux.dev>; Mon, 09 Aug 2021 23:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJblD1y+qHn3wdjDCoDkUfQxp7E9z/k1WwnfUwfIYyM=;
        b=WYP8kUAPCPad7gI6jY98V65Vgu7u4/0nE4cFaF3MnWAhh+uO5OikXIunOk5RNWWCkS
         2L6VtL9haY/GqvhguHP/OSS0aEwBYpZBbwTv59KTSkIWXCAubBcnZv+Ls75+kPb7Hwdr
         QFsD1CY6vuPvVsb34IIukZYV4wBtB8OTcY89cNj4qUQjXOv3Cr67D/BbNJNOcCdgw3jI
         vUDVtu1E7ioVS7PDsYvp93akWuyAEw01sq0vGI5iAfR3lnitOOFNtmVwHjugdjbv8j2t
         VqvUd/LaVckZJjeD2gl4nlS9FnV1DW56dAPD5t5rtIGQEDH4QrcqceouPgW1n3XS3B/+
         ouPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJblD1y+qHn3wdjDCoDkUfQxp7E9z/k1WwnfUwfIYyM=;
        b=t5ZyoUJcVqBp3vx10YkKImy5RoPQKTdVZam7wqVKnqPnX9wOmREwWAL0HTLvUEdVWl
         SuqeRkRJ+DZkRIuA5d5CQ5lATfZaCW3l/ycwwmNGGoLQcTtGE8Ykq8Q9kifdXqwVRCG7
         Dw7sQvnDZ3rykYN2xodgQhQaK4R+oIfJrkNZNwXHbsNrPlFktddnaM16WsYSr2BvHoaI
         YsFKOJMTosC29IEp3Dbg6u2J2PAADKSvprwi3LkLEZhXI7MjPzDOOmRgPZ+KZ65rOplN
         GNGmwT0ZRQE6CLt/fo4rhr8U8WTgCbFlHBSuAg1eIQecDMxlE9b6Og5pjkR4fLqx3hN4
         toAA==
X-Gm-Message-State: AOAM531iJYcbz/+f5tPWDoRXRYhit/AAG1ln34a1USnJoIE1aFLXu3ZU
	Qpbpg4BptpjtU4pFjKK+MKTIcQ==
X-Google-Smtp-Source: ABdhPJwEfhyq1oDAPUD+NUvsniIszXrUrcqLIpaj8cWNmXevuFhB6Zr+WNuDP199OnFXqedrudhx9A==
X-Received: by 2002:ac2:4472:: with SMTP id y18mr20677419lfl.137.1628576783588;
        Mon, 09 Aug 2021 23:26:23 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id c9sm1957788lfr.46.2021.08.09.23.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 23:26:22 -0700 (PDT)
From: "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
	id 8BED5102BBF; Tue, 10 Aug 2021 09:26:34 +0300 (+03)
To: Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>
Cc: Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 0/5] x86: Impplement support for unaccepted memory
Date: Tue, 10 Aug 2021 09:26:21 +0300
Message-Id: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UEFI Specification version 2.9 introduces concept of memory acceptance:
Some Virtual Machine platforms, such as Intel TDX or AMD SEV-SNP,
requiring memory to be accepted before it can be used by the guest.
Accepting happens via a protocol specific for the Virtrual Machine
platform.

Accepting memory is costly and it makes VMM allocate memory for the
accepted guest physical address range. We don't want to accept all memory
upfront.

The patchset implements on-demand memory acceptance for TDX.

Please, review. Any feedback is welcome.

Kirill A. Shutemov (5):
  mm: Add support for unaccepted memory
  efi/x86: Implement support for unaccepted memory
  x86/boot/compressed: Handle unaccepted memory
  x86/mm: Provide helpers for unaccepted memory
  x86/tdx: Unaccepted memory support

 Documentation/x86/zero-page.rst              |  1 +
 arch/x86/Kconfig                             |  1 +
 arch/x86/boot/compressed/Makefile            |  1 +
 arch/x86/boot/compressed/bitmap.c            | 86 ++++++++++++++++++++
 arch/x86/boot/compressed/kaslr.c             | 14 +++-
 arch/x86/boot/compressed/misc.c              |  9 ++
 arch/x86/boot/compressed/tdx.c               | 29 +++++++
 arch/x86/boot/compressed/unaccepted_memory.c | 51 ++++++++++++
 arch/x86/include/asm/page.h                  |  5 ++
 arch/x86/include/asm/tdx.h                   |  2 +
 arch/x86/include/asm/unaccepted_memory.h     | 17 ++++
 arch/x86/include/uapi/asm/bootparam.h        |  3 +-
 arch/x86/kernel/tdx.c                        |  8 ++
 arch/x86/mm/Makefile                         |  2 +
 arch/x86/mm/unaccepted_memory.c              | 84 +++++++++++++++++++
 drivers/firmware/efi/Kconfig                 | 12 +++
 drivers/firmware/efi/efi.c                   |  1 +
 drivers/firmware/efi/libstub/x86-stub.c      | 75 ++++++++++++++---
 include/linux/efi.h                          |  3 +-
 mm/internal.h                                | 14 ++++
 mm/memblock.c                                |  1 +
 mm/page_alloc.c                              | 13 ++-
 22 files changed, 414 insertions(+), 18 deletions(-)
 create mode 100644 arch/x86/boot/compressed/bitmap.c
 create mode 100644 arch/x86/boot/compressed/unaccepted_memory.c
 create mode 100644 arch/x86/include/asm/unaccepted_memory.h
 create mode 100644 arch/x86/mm/unaccepted_memory.c

-- 
2.31.1

