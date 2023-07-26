Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130E617C5
	for <linux-coco@lists.linux.dev>; Wed, 26 Jul 2023 02:57:16 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=wuzongyong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VoEmuIz_1690339293;
Received: from localhost(mailfrom:wuzongyong@linux.alibaba.com fp:SMTPD_---0VoEmuIz_1690339293)
          by smtp.aliyun-inc.com;
          Wed, 26 Jul 2023 10:41:34 +0800
Date: Wed, 26 Jul 2023 10:41:33 +0800
From: Wu Zongyong <wuzongyong@linux.alibaba.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, x86@kernel.org
Cc: linux-coco@lists.linux.dev, thomas.lendacky@amd.com
Subject: [Question] int3_selftest() generates a #UD instead of a #BP when
 create a SEV VM
Message-ID: <20230726024133.GA434307@L-PF27918B-1352.>
Reply-To: Wu Zongyong <wuzongyong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi,

I try to boot a SEV VM (just SEV, no SEV-ES and no SEV-SNP) with a
firmware written by myself.

But when the linux kernel executed the int3_selftest(), a #UD generated
instead of a #BP. 

The stack is as follows.

    [    0.141804] invalid opcode: 0000 [#1] PREEMPT SMP^M
    [    0.141804] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.3.0+ #37^M
    [    0.141804] RIP: 0010:int3_selftest_ip+0x0/0x2a^M
    [    0.141804] Code: eb bc 66 90 0f 1f 44 00 00 48 83 ec 08 48 c7 c7 90 0d 78 83 c7 44 24 04 00 00 00 00 e8 23 fe ac fd 85 c0 75 22 48 8d 7c 24 04 <cc> 90 90 90 90 83 7c 24 04 01 75 13 48 c7 c7 90 0d 78 83 e8 42 fc^M
    [    0.141804] RSP: 0000:ffffffff82803f18 EFLAGS: 00010246^M
    [    0.141804] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000007ffffffe^M
    [    0.141804] RDX: ffffffff82fd4938 RSI: 0000000000000296 RDI: ffffffff82803f1c^M
    [    0.141804] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000fffeffff^M
    [    0.141804] R10: ffffffff82803e08 R11: ffffffff82f615a8 R12: 00000000ff062350^M
    [    0.141804] R13: 000000001fddc20a R14: 000000000090122c R15: 0000000002000000^M
    [    0.141804] FS:  0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:0000000000000000^M
    [    0.141804] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033^M
    [    0.141804] CR2: ffff888004c00000 CR3: 000800000281f000 CR4: 00000000003506f0^M
    [    0.141804] Call Trace:^M
    [    0.141804]  <TASK>^M
    [    0.141804]  alternative_instructions+0xe/0x100^M
    [    0.141804]  check_bugs+0xa7/0x110^M
    [    0.141804]  start_kernel+0x320/0x430^M
    [    0.141804]  secondary_startup_64_no_verify+0xd3/0xdb^M
    [    0.141804]  </TASK>^M
    [    0.141804] Modules linked in:^M
    [    0.141804] ---[ end trace 0000000000000000 ]--

I'm curious how this happend. I cannot find any condition that would
cause the int3 instruction generate a #UD according to the AMD's spec.

BTW, it worked nomarlly with qemu and ovmf.

Any suggestion would be appreciated!

Thanks,
Wu Zongyong
